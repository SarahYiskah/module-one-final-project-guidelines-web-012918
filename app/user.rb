require 'pry'
require 'rest-client'
require 'json'
class User < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds
  
  ALL = []
  def initialize(name)
    @name = name
    ALL << self
  end
  def self.all
    ALL
  end

  #gets location of user
  def get_location
    ip_address = `curl ifconfig.me`.chomp
    location = RestClient.get("http://ip-api.com/json/#{ip_address}")
    JSON.parse(location)
  end

  def country
    location = get_location
    location["country"]
  def city
    location = get_location
    location["city"]
  end
  def latitude
    location = get_location
    location["lat"]
  end
  def longitude
    location = get_location
    location["lon"]
  end
end

user = User.new("sarah")
puts user.city
puts user.latitude
puts user.longitude
