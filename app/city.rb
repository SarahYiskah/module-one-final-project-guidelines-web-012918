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
end
