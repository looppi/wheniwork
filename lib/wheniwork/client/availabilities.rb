module WhenIWork
  class Client
    module Availabilities
      
      def availabilities(user_id, params = {}, options = {})
        get "availabilities?user_id=#{user_id}", params, options
      end 
      
      def availabilities_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        data = get "availabilities/items?user_id=#{user_id_array}&start=#{start_datetime}&end=#{end_datetime}", params, options
        return data["availabilityitems"]
      end        

    end
  end
end
