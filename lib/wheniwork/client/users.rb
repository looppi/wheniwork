require 'json'

module WhenIWork
  class Client
    module Users

      def users(params = {}, options = {})
        get 'users', params, options.merge(key: 'wheniwork_users')
      end
      
      def get_user_ids(params = {}, options = {})
       data = get 'users', params, options.merge(key: 'wheniwork_users')
       users = data["users"]
       #parsed = JSON.parse(data)
       usersArr = Array.new
       users.each do |user|
         usersArr << user["id"]
       end
       
       return usersArr
      end
      
      def user(user_id, params = {}, options = {})
        get "users/#{user_id}", params, options
      end

    end
  end
end
