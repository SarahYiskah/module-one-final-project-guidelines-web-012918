require 'active_record'
class Round < ActiveRecord::Base

  belongs_to :game
  belongs_to :user

  def self.scoreboard
    puts "High Scores:".colorize(color: :magenta, mode: :blink)
    table_data = []
    Round.all.each do |round|
      table_data << {"User" => round.user.name, "Score" => round.game.score}
    end
    table_data.sort_by!{|k| k["Score"]}.reverse!
    table_data = table_data.first(5)
    Formatador.display_compact_table(table_data)
  end

end
