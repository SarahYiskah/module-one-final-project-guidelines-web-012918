require 'require_all'
require 'active_record'

class Turn

  attr_reader :difficulty

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
      puts "#{counter}. #{city.name}"
      counter +=1
    end
  end

  def check_answer(cities)
    cities.sort_by!{|city| city.distance}
    puts cities[0].name
    answer = gets.chomp
    if answer == cities[0].name
      puts "Correct!"
      return 1
    else
      puts "Sorry, that's incorrect."
      return 0
    end
  end

end
