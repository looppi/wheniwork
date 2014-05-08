module WhenIWork
  class Client
    module Shifts
      def positions(params = {}, options = {})
        get 'positions', params, options.merge(key: 'wheniwork_positions')
      end

      def shifts_by_users(user_ids, params = {}, options = {})
        users_str = user_ids.join(',')
        get "shifts?user_id=#{users_str}", params, options.merge(key: 'wheniwork_shifts')
      end


      def shifts(params = {}, options = {})
        get 'shifts', params, options.merge(key: 'wheniwork_shifts')
      end

      def shifts_by_criteria(start_date, end_date, params = {}, options = {})
        get "shifts?start=#{start_date}&end=#{end_date}", params, options.merge(key: 'wheniwork_shifts')
      end

      def shift(shift_id, params = {}, options = {})
        get "shifts/#{shift_id}", params, options
      end      
      
      def create_shift(params = {}, options = {})
        post "shifts/", params, options
      end
      
    end
  end
end
