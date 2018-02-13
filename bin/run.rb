require_relative '../config/environment'
require 'require_all'
require_all 'app'

game = Game.new

# welcome user and give instructions
puts "Hello. Welcome to TweenGame. Please enter your name:"
input = gets.chomp
user = User.new(input)
puts "Hi, #{input.capitalize}! You are playing from #{user.city}!"

cities = City.city_distances
difficulty = 0

10.times do
  turn = Turn.new(difficulty)
  sample_cities = turn.get_cities(cities)
  turn.display_cities(sample_cities)
  answer = turn.get_answer
  if answer == "exit" || answer == "quit"
    break
  else
    game.score += turn.check_answer(answer, sample_cities)
    difficulty +=1
  end
end

if game.score <= 4
  puts "You scored #{game.score}/10 correct answers. Better luck next time!"
elsif game.score <= 7
  puts "You scored #{game.score}/10 correct answers. Great Job!"
elsif game.score <= 9
  puts "You scored #{game.score}/10 correct answers. Wow! Amazing job!"
elsif game.score == 10
  puts "You scored #{game.score}/10 correct answers! That's a perfect score!"
end
