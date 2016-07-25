SQMETERS_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

square_meters = (length * width).round(1)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)
puts "The area of the room is #{square_meters} square_meters (#{square_feet} square feet)."
