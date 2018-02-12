require 'rest-client'
require 'json'
require 'pry'
class City
  attr_accessor :city_name, :country, :latitude :longitude
  #chooses 4 random cities
  def self.get_cities
  #make the web request
    all_cities = RestClient.get('https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json')
    cities_array = JSON.parse(all_cities)
    cities_array.sample(150)
  end

  def self.get_cities_by_country(user)
  #make the web request
    all_cities = RestClient.get('https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json')
    cities_array = JSON.parse(all_cities)
    cities_array.sample(150)
  end

end
