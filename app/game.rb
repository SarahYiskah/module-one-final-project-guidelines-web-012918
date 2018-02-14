require 'active_record'
require_relative '../config/environment.rb'
# require_relative 'user.rb'
require_relative 'city.rb'
require 'formatador'

class Game < ActiveRecord::Base
  has_many :rounds
  has_many :users, through: :rounds


  def self.scoreboard
    puts "High Scores:".colorize(color: :magenta, mode: :blink)
    table_data = []
    Game.all.each do |game|
      # binding.pry
      table_data << {"User" => game.users.last.name, "Score" => game.score}
    end
    table_data.sort_by!{|k| k["Score"]}.reverse!
    table_data = table_data.first(5)
    Formatador.display_compact_table(table_data)
  end

end
