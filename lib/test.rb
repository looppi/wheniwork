
require 'wheniwork'

WhenIWork.configure do |c|
  c.username = 'haider_6017@hotmail.com'
  c.password = 'welcome123'
  c.api_key = '437b1f933f5c3feda65b2b1088c427b587c95638'
end

client = WhenIWork::Client.new

#puts client.user 747045
#puts client.availabilities 744641
puts client.availabilities_by_criteria [744641,747045], DateTime.new(2014,04,01,7,0).strftime("%F %I:%M%p"), DateTime.new(2014,04,30,23,59).strftime("%F %I:%M%p")
#puts client.availabilities_by_criteria [744641,747045], '2014-04-01 7:00am', '2014-04-30 23:59pm'
#puts client.users
#puts client.shifts
#puts client.positions
#puts client.locations