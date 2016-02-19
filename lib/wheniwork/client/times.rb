module WhenIWork
  class Client
    module Times

      def times_by_id(request_id, params = {}, options = {})
        get "times/#{request_id}", params, options
      end


      def times(user_id, params = {}, options = {})
        get "times?user_id=#{user_id}", params, options
      end

      def times_for_time(start_datetime, end_datetime, params = {}, options = {})
        get "times?start=#{start_datetime}&end=#{end_datetime}", params, options
      end

      def times_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        users_str = user_id_array.join(',')
        data = get "times?user_id=#{users_str}&start=#{start_datetime}&end=#{end_datetime}", params, options
        return data
      end
    end
  end
end
