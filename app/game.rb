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
    turn_count = 1

    10.times do
      turn = Turn.new(difficulty)
      sample_cities = City.get_cities(turn, cities)
      turn.display_cities(sample_cities)
      answer = turn.get_answer
      answer_return = turn.check_answer(answer, sample_cities)
      if turn_count != 10
        if answer_return == 1
          pid = fork{ exec 'afplay', "media/01 Winning Sound.mp3"}
        elsif answer_return == 0
          pid = fork{ exec 'afplay', "media/02 Losing Sound.mp3"}
        end
      end
      if answer == "exit" || answer == "quit"
        break
      else
        game_score += answer_return
        difficulty +=1
      end
      turn_count += 1
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
    pid = fork{ exec 'afplay', "media/03 Intro Music.mp3"}
  end

end
