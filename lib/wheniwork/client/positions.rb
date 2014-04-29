module WhenIWork
  class Client
    module Positions

      def positions(params = {}, options = {})
        get 'positions', params, options.merge(key: 'wheniwork_positions')
      end
      def position(position_id, params = {}, options = {})
        get "positions/#{position_id}", params, options
      end

    end
  end
end
