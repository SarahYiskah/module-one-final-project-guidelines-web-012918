require 'require_all'
require 'active_record'
require 'pry'
require 'i18n'

class Turn

  attr_reader :difficulty

  GOOD = ["Super!", "That’s right!", "That’s good!", "Exactly right!", "Now you’ve figured it out.", "That’s it!", "Great!", "I knew you could do it.", "Wow!", "Terrific!", "Sensational!", "Excellent!", "Perfect!", "Nice going.", "Fantastic!", "Tremendous!", "That’s great.", "Marvelous!", "Cool!"]
  BAD = ["Sorry!", "That's not right.", "Incorrect!", "That's wrong.", "You missed that one!", "That's not it", "So close!", "Keep trying.", "That's incorrect.", "Oops!"]

  def initialize(difficulty)
    @difficulty = difficulty
  end

  def display_cities(cities)
    puts "Which city are you closest to?".colorize(mode: :underline, color: :magenta)
    counter = 1
    cities.each do |city|
      puts "#{counter}. #{city.city}".colorize(color: :yellow)
      counter +=1
    end
  end

  def get_answer
    answer = gets.chomp
  end

  def check_answer(answer, cities)
    sorted_cities = cities.sort_by{|city| city.distance}
    correct_answer = sorted_cities[0].city
    if answer.downcase == I18n.transliterate(correct_answer.downcase) || answer.to_i == cities.index(sorted_cities[0]) + 1
      pid = fork{ exec 'afplay', "media/01 Winning Sound.mp3"}
      puts GOOD.sample.colorize(color: :green) + " #{correct_answer} is #{sorted_cities[0].distance.round} miles away.".colorize(color: :green)
      return 1
    else
      pid = fork{ exec 'afplay', "media/02 Losing Sound.mp3"}
      puts BAD.sample.colorize(color: :red) + " The correct answer was #{correct_answer}, which is #{sorted_cities[0].distance.round} miles away.".colorize(color: :red)
      return 0
    end
  end

end
