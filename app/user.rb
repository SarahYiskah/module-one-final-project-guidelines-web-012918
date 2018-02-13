require 'pry'
require 'rest-client'
require 'json'
require 'active_record'
require_relative '../config/environment.rb'

class User < ActiveRecord::Base
  has_many :rounds
  has_many :games, through: :rounds

  attr_accessor :name, :location
  ALL = []
  def initialize(name)
    @name = name
    @location = get_location
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
