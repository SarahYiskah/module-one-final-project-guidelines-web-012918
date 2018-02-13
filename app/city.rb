require 'active_record'
require_relative '../config/environment.rb'

class City < ActiveRecord::Base
  def self.city_distances
    City.all.each do |city|
      from = {longitude: 40.00, latitude: -74.00}
      to = {lng: city.lng, lat: city.lat}
      dist = Geodistance.new(from, to).haversine
      city.update_attribute(:distance, dist)
    end
    cities = City.order('distance')
    cities
  end
end
