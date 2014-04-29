module WhenIWork
  class Client
    module Users

      def users(params = {}, options = {})
        get 'users', params, options.merge(key: 'wheniwork_users')
      end
      def user(user_id, params = {}, options = {})
        get "users/#{user_id}", params, options
      end

    end
  end
end
