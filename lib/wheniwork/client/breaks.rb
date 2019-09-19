require 'uri'
module WhenIWork
  class Client
    module Breaks
      def breaks_by_criteria(start_date, end_date, page = 1, options = {})
        start_ts = URI.encode(start_date.beginning_of_day.iso8601)
        end_ts = URI.encode(end_date.end_of_day.iso8601)
        params = {
            'startTime': start_ts,
            'endTime': end_ts,
            'page': page,
        }
        get_v3("shift-breaks",
               params, options)
      end
    end
  end
end