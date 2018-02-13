require_relative '../config/environment'
require 'require_all'
require_all 'app'

game = Game.new

# welcome user and give instructions
puts "Hello. Welcome to TweenGame. Please enter your name:"
input = gets.chomp
user = User.new(input)
puts "You are playing from #{user.city}!"

cities = City.city_distances
difficulty = 0

10.times do
  turn = Turn.new(difficulty)
  sample_cities = turn.get_cities(cities)
  turn.display_cities(sample_cities)
  game.score += turn.check_answer(sample_cities)
  difficulty +=1
end

puts game.score
