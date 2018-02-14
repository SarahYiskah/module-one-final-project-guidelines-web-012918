require 'pry'
require 'rest-client'
require 'json'
require 'active_record'
require_relative '../config/environment.rb'

class User < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds

  attr_accessor :location
  # ALL = []
  @location = {}
  
  def get_location
    ip_address = `curl -s ifconfig.me`.chomp
    location = RestClient.get("http://ip-api.com/json/#{ip_address}")
    @location = JSON.parse(location)
  end

  def country
    @location["country"]
  end

  def city
    @location["city"]
  end

  def latitude
    @location["lat"]
  end

  def longitude
    @location["lon"]
  end
end
