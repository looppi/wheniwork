module WhenIWork
  class Client
    module Requests

      def request_by_id(request_id, params = {}, options = {})
        get "requests/#{request_id}", params, options
      end


      def requests(user_id, params = {}, options = {})
        get "requests?user_id=#{user_id}", params, options
      end

      def requests_for_time(start_datetime, end_datetime, params = {}, options = {})
        get "requests?start=#{start_datetime}&end=#{end_datetime}", params, options
      end

      def requests_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        users_str = user_id_array.join(',')
        data = get "requests?user_id=#{users_str}&start=#{start_datetime}&end=#{end_datetime}", params, options
        return data
      end
    end
  end
end
