require 'active_record'
require_relative '../config/environment.rb'
# require_relative 'user.rb'
require_relative 'geodistance.rb'
require_relative 'city.rb'

class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds

  attr_accessor :score

  def initialize(score = 0)
    @score = score
  end

end
