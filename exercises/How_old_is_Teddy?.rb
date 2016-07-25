=begin

Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output

Teddy is 69 years old!

=end

puts "What is your name?"
name = gets.chomp
if name == ""
  name = "Teddy"
end
age = rand(20..200)
puts "#{name} is #{age} years old!"

