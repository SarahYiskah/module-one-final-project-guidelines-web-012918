require_relative '../config/environment.rb'
require_relative 'city.rb'
require 'active_record'
require 'formatador'

class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds
  def self.play
    game_score = 0
    puts "Please enter your name:".colorize(color: :green)
    input = gets.chomp
    user = User.create(name: input.capitalize)
    user.get_location
    puts "Hi, #{input.capitalize}! You are playing from #{user.city}!".colorize(color: :yellow)

    cities = City.city_distances(user)
    difficulty = 0

    10.times do
      turn = Turn.new(difficulty)
      sample_cities = City.get_cities(turn, cities)
      turn.display_cities(sample_cities)
      answer = turn.get_answer
      if answer == "exit" || answer == "quit"
        break
      else
        game_score += turn.check_answer(answer, sample_cities)
        difficulty +=1
      end
    end

    game = Game.create(score: game_score)
    round = Round.create(user: user, game: game)

    if game_score < 7
      puts "Game over!".colorize(color: :magenta, mode: :blink)
      puts "You scored #{game_score}/10 correct answers!".colorize(color: :green)
    elsif game_score <= 9
      puts "Game over!".colorize(color: :magenta, mode: :blink)
      puts "You scored #{game_score}/10 correct answers. Wow! Amazing job!".colorize(color: :green)
    elsif game_score == 10
      puts "Game over!".colorize(color: :magenta, mode: :blink)
      puts "You scored #{game_score}/10 correct answers! That's a perfect score!".colorize(color: :green)
    end
    Round.scoreboard

  end

end
