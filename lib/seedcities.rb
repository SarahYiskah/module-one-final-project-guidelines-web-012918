require 'rest-client'
require 'json'
require 'require_all'
require 'pry'
require_relative "../app/city.rb"


def get_cities
#make the web request
  all_cities = RestClient.get('https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json')
  cities_array = JSON.parse(all_cities)
  cities_array = cities_array.sample(150)
  cities_array.each do |city|
  city["distance"] = 0
  end
end

def seed_database
  get_cities.each do |city|
    City.create(city)
  end
end
