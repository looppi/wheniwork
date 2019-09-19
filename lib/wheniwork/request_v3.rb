module WhenIWork
  module RequestV3
    def get_v3(path, params={}, options={})
      # endpoint changes
      # headers change
      v3_path = "v3/#{path}"
      request(:get, v3_path, default_request_params.merge(params), options)
    end
  end
end