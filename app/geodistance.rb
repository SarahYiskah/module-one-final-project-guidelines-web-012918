require 'require_all'
require_relative '../config/environment.rb'

class Geodistance
  include Math
  attr_reader :from, :to, :lat1, :lon1, :lat2, :lon2
  RADIUS = 6371
  def initialize(from, to)
    @from = from
    @to = to
    set_variables
  end
  def distance(type = 'haversine')
    begin
      self.send(type.to_sym)
    rescue
      raise NotImplementedError, 'The type you have requested is not implemented, try "cosines" or "approximation", or without params for "haversine"'
    end
  end

  def haversine
    d_lat = (from[:latitude] - to[:lat])/(180 * Math::PI)
    d_lon = (from[:longitude] - to[:lng])/(180 * Math::PI)
    a = sin(d_lat / 2) * sin(d_lat / 2) + sin(d_lon / 2) *
      sin(d_lon / 2) * cos(lat1) * cos(lat2)
    c = 2 * atan2(sqrt(a), sqrt(1-a))
    RADIUS * c
  end
  def cosines
    acos(sin(lat1) * sin(lat2) +
         cos(lat1) * cos(lat2) *
         cos(lon2 - lon1)) * RADIUS
  end
  def approximation
    x = (lon2 - lon1) * cos((lat1 + lat2) / 2)
    y = lat2 - lat1
    sqrt(x * x + y * y) * RADIUS
  end
  def set_variables
    @lat1 = (from[:latitude])/(180 * Math::PI)
    @lat2 = (to[:lat])/(180 * Math::PI)
    @lon1 = (from[:longitude])/(180 * Math::PI)
    @lon2 = (to[:lng])/(180 * Math::PI)
  end
end
