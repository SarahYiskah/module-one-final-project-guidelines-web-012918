require_relative '../config/environment'
require 'require_all'
require_all 'app'
require 'pry'



# User.delete_all
# Game.delete_all
# Round.delete_all
response = 0
puts "Hello. Welcome to TweenGame!"
while response != 3
  puts "Enter 1 to play a new game, 2 to see the scoreboard or 3 to Exit."
  response = gets.chomp
  if response.to_i == 2
    Game.scoreboard
  elsif response.to_i == 1
    Round.play
  elsif response.to_i == 3
    break
  else
    puts "Invalid Input"
  end
end
