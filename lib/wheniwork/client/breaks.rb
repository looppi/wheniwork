require 'uri'
module WhenIWork
  class Client
    module Breaks
      def breaks_by_criteria(start_date, end_date, page = 1, params = {}, options = {})
        start_ts = URI.encode(start_date.beginning_of_day.iso8601)
        end_ts = URI.encode(end_date.end_of_day.iso8601)
        all_params = {
            'startTime': start_ts,
            'endTime': end_ts,
            'page': page,
        }.merge(params)
        get_v3("shift-breaks",
               all_params, options)
      end
    end
  end
end