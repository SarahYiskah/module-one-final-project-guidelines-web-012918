require 'require_all'

class Turn

  correct_answer_number == 0
  def turn_by_country
    cities = City.get_cities_by_country.sample(4)
    puts "Which city are you closest to:"
    counter = 1
    cities.each do |city|
      puts "#{counter}. #{city}"
      counter +=1
    end
    answer = gets.chomp.downcase
  #if answer == correct_answer or correct_answer_number
  #prints correct
  #update score >> correct_answer_number +=1
  #call another turn as long as turn_count < 11
  #final score is correct_score/10
  end

#calculates distance of each city to location of user
#increase difficulty
#first amount will be same country
#shows user the random cities and get input of which city user thinks is closest
#checks to see if input is correct.
#get a score



end
