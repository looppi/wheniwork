require 'wheniwork/request'
require 'wheniwork/request_v3'
require 'wheniwork/client/users'
require 'wheniwork/client/shifts'
require 'wheniwork/client/positions'
require 'wheniwork/client/locations'
require 'wheniwork/client/availabilities'
require 'wheniwork/client/requests'
require 'wheniwork/client/times'
require 'wheniwork/client/breaks'


module WhenIWork
  class Client
    include WhenIWork::Request
    include WhenIWork::RequestV3
    include WhenIWork::Client::Users
    include WhenIWork::Client::Shifts
    include WhenIWork::Client::Positions
    include WhenIWork::Client::Locations
    include WhenIWork::Client::Availabilities
    include WhenIWork::Client::Requests
    include WhenIWork::Client::Times
    include WhenIWork::Client::Breaks
  end
end
