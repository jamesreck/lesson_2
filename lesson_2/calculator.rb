#asks for two numbers
#asks for the type of operation to perform (add, subtract, multiply, divide) 
#do the operation
#displays the result

puts("welcome to Calculator!")
puts "What's the first number?"
num_1 = gets.chomp
puts "What is the second number?"
num_2 = gets.chomp

puts "Your numbers are #{num_1} and #{num_2}. What would you like to do with them? Enter 1 for add. Enter 2 for subtract. Enter 3 for multiply. Enter 4 for divide."

input = gets.chomp
answer = nil

case input
  when "1"
    answer = num_1.to_i + num_2.to_i
  when "2"
    answer = num_1.to_i - num_2.to_i
  when "3"
    answer = num_1.to_i * num_2.to_i
  when "4"
    answer = num_1.to_f / num_2.to_f
  else
    answer = "Error! Invalid operator!"
end

puts "The result is: #{answer}"

