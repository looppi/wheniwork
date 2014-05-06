module WhenIWork
  class Client
    module Availabilities
      
      def availabilities(user_id, params = {}, options = {})
        get "availabilities?user_id=#{user_id}", params, options
      end 
      
      def availabilities_list(user_id_array, params = {}, options = {})
        data = get "availabilities?user_id{user_id_array}", params, options
        
      end
      
      def availabilities_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        data = get "availabilities/items?user_id=#{user_id_array}&start=#{start_datetime}&end=#{end_datetime}", params, options
        #return data["availabilityitems"]
      end

      def unavailabledays_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        data = self.unavailabilities_by_criteria user_id_array, start_datetime, end_datetime, params, options
        dataArray = data["availabilityitems"]
        $i = 0
        while $i < dataArray.length do
          item = dataArray[$i]
          if item["start_time"] != "00:00:00" || item["end_time"] != "00:00:00"
            dataArray.delete(item)
          else
            $i = $i + 1
          end
        end
        return data
      end

      def unavailabilities_by_criteria(user_id_array,start_datetime, end_datetime, params = {}, options = {})
        data = self.availabilities_by_criteria user_id_array, start_datetime, end_datetime, params, options
        dataArray = data["availabilityitems"]   
        $i = 0
        while $i < dataArray.length do
          item = dataArray[$i]          
          if item["type"] == 2
            dataArray.delete(item)            
          elsif item["type"] == 1            
            $i = $i + 1
          end          
        end
        return data
      end
  end
end
