require 'require_all'
require 'active_record'
require 'pry'
require "i18n"

class Turn

  attr_reader :difficulty

  GOOD = ["Super!", "That’s right!", "That’s good!", "Exactly right!", "Now you’ve figured it out.", "That’s it!", "Great!", "I knew you could do it.", "Wow!", "Terrific!", "Sensational!", "Excellent!", "Perfect!", "Nice going.", "Fantastic!", "Tremendous!", "That’s great.", "Marvelous!", "Cool!"]
  BAD = ["Sorry!", "That's not right.", "Incorrect!", "That's wrong.", "You missed that one!", "That's not it", "So close!", "Keep trying.", "That's incorrect.", "Oops!"]

  def initialize(difficulty)
    @difficulty = difficulty
  end

  def get_cities(cities)
    if @difficulty < 2
      cities[1..10].sample(4).shuffle!
    elsif @difficulty < 4
      cities[1..50].sample(4).shuffle!
    elsif @difficulty < 6
      cities[1..100].sample(4).shuffle!
    elsif @difficulty < 8
      cities[1..120].sample(4).shuffle!
    elsif @difficulty < 10
      cities[1..150].sample(4).shuffle!
    end
  end

  def display_cities(cities)
    puts "Which city are you closest to?"
    counter = 1
    cities.each do |city|
      puts "#{counter}. #{city.city}"
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
      puts GOOD.sample
      return 1
    else
      puts BAD.sample + " The correct answer was #{correct_answer}."
      return 0
    end
  end

end
