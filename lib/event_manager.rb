puts "Event Manager Initialized!"
File.exist? "event_attendees.csv"

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  puts line
end

