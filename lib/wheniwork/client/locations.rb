module WhenIWork
  class Client
    module Locations

      def locations(params = {}, options = {})
        get 'locations', params, options.merge(key: 'wheniwork_locations')
      end
      def location(location_id, params = {}, options = {})
        get "locations/#{location_id}", params, options
      end

    end
  end
end
