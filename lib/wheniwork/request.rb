module WhenIWork
  module Request

    def get(path, params={}, options={})
      request :get, "2/#{path}", default_request_params.merge(params), options
    end

    def post(path, params={}, options={})
      request :post, "2/#{path}", default_request_params.merge(params), options
    end

    def request(method, path, params, cache_options)
      json_params = params.to_json
      if cache_enabled
        key = cache_options.delete(:key) || cache_key_for(path, params)
        options = default_options.merge(cache_options)
        cache_store.fetch(key, options) do
          if method == :post
            conn = connection
            response = conn.post do |req|
              req.url endpoint + path
              req.headers['Content-Type'] = 'application/json'
              req.headers['W-Token'] = token.to_s
              req.body = json_params.to_s
            end
            response.body
          else
            connection.send(method, path, params).body
          end
        end
      else
        response = connection.send(method) do |req|
          req.url endpoint + path
          req.params = params
          req.headers['W-Token'] = cache_options['W-Token'].to_s
          req.headers['W-UserID'] = cache_options['W-User-ID'].to_s
        end

        response.body
      end
    end

    def cache_key_for(uri, params)
      params[:uri] = uri
      ::Marshal.dump(params)
    end

    def default_options
      { expires_in: WhenIWork.configuration.expires_in }
    end

    def connection
      @connection ||= Faraday.new(:url => endpoint) do |faraday|
        faraday.request  :url_encoded

        faraday.response :json, :content_type => /\bjson$/
        faraday.adapter  Faraday.default_adapter
      end
    end

    def default_request_params
      { "W-Token" => token }
    end

    def endpoint
      WhenIWork.configuration.endpoint
    end

    def token
      if cache_enabled
        cache_store.fetch('wheniwork_token', default_options) do
          login['token']
        end
      else
        login['token']
      end
    end

    def auth_params
      {
        username: WhenIWork.configuration.username,
        password: WhenIWork.configuration.password,
        key:      WhenIWork.configuration.api_key
      }
    end

    def login
      connection.post('2/login', auth_params.to_json).body
    end

    def cache_store
      WhenIWork.configuration.cache_store
    end

    def cache_enabled
      WhenIWork.configuration.cache_enabled
    end

    def login_tokens
      login_response = login
      if login_response.include?("users")
        login_response['users'].map{|u| {"W-Token" => u['token'], "W-UserId" => u['id'], "W-User-ID" => u['id']}}
      else
        [{"W-Token" => login_response['token'], "W-UserId" => login_response['id'], "W-User-ID" => login_response['id']}]
      end
    end
  end
end
