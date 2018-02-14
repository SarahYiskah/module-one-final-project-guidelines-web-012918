require 'active_record'
require_relative '../config/environment.rb'
require 'haversine'

class City < ActiveRecord::Base

  def self.city_distances(user)
    City.all.each do |city|
      from_lat = user.latitude
      from_lon = user.longitude
      to_lat = city.latitude
      to_lon = city.longitude
      dist = Haversine.distance(from_lat, from_lon, to_lat, to_lon).to_miles
      city.update_attribute(:distance, dist)
    end
    cities = City.order('distance')
    cities
  end

  def self.get_cities(turn, cities)
    if turn.difficulty < 2
      cities[1..10].shuffle[0..3]
    elsif turn.difficulty < 4
      cities[1..50].shuffle[0..3]
    elsif turn.difficulty < 6
      cities[1..100].shuffle[0..3]
    elsif turn.difficulty < 8
      cities[1..120].shuffle[0..3]
    elsif turn.difficulty < 10
      cities[1..150].shuffle[0..3]
    end
  end

end
