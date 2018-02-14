require 'active_record'
class Round < ActiveRecord::Base

  belongs_to :game
  belongs_to :user

  def self.play
    game_score = 0
    puts "Please enter your name:"
    input = gets.chomp
    user = User.create(name: input.capitalize)
    user.get_location
    puts "Hi, #{input.capitalize}! You are playing from #{user.city}!"

    cities = City.city_distances(user)
    difficulty = 0

    10.times do
      turn = Turn.new(difficulty)
      sample_cities = turn.get_cities(cities)
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
    if game_score <= 4
      puts "You scored #{game_score}/10 correct answers. Better luck next time!"
    elsif game_score <= 7
      puts "You scored #{game_score}/10 correct answers. Great Job!"
    elsif game_score <= 9
      puts "You scored #{game_score}/10 correct answers. Wow! Amazing job!"
    elsif game_score == 10
      puts "You scored #{game_score}/10 correct answers! That's a perfect score!"
    end
    Game.scoreboard

  end

end
