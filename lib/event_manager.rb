puts "Event Manager Initialized!"
require "csv"

contents = CSV.open(
  'event_attendees.csv', 
  headers: true,
  header_converters: :symbol
  )

contents.each do |row|
  name = row[:first_name]
  zipcode = row[:zipcode]

  #if the zipcode is 5 digits assume its okay
  #if zipcode isn't there it will output nil, we must check for this and give it a default value.
  if zipcode.nil?
    zipcode = '00000'
  #if the zipcode is less than five digits, add zeros to the front until it becomes five digits.
  elsif zipcode.length < 5
    zipcode = zipcode.rjust(5, '0')
    #if the zipcode is more than five digits, truncate it to the first five digits
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  end
  
  puts "#{name} #{zipcode}"
end

