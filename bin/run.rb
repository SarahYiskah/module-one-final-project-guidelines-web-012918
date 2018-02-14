require_relative '../config/environment'
require 'require_all'
require_all 'app'
require 'pry'
require 'colorize'



# User.delete_all
# Game.delete_all
# Round.delete_all
response = 0
puts "


        _______ _  _  _ _______ _______ __   _
           |    |  |  | |______ |______ |\\  |
           |    |__|__| |______ |______ | \\_|



                     .───────████.
                  ,─'           █████
               █████            ████████
             ,'█████              ████████
            ╱   █████████ ████    █████████
           ╱    ██████████████   ███████ ██╲
          ;     ███████████      ██████ █████
          ;      █████████     ███      █████
         ;      ██ █████       ███      █████:
         │      ██                █████████  │
         │       ██              ███████████ │
         :       █████████      █████████████;
          :       █████████      ███████████;
          :      ███████████       ███████  ;
           ╲     ███████████         █████ ╱
            ╲     █████████          █████╱
             ╲     ███████           █████
              `.    ██████          ████'
                '─.   ████          ███
                   '─.████       ,─'
                      `─██──────'


                                   ".colorize(color: :green)

pid = fork{ exec 'afplay', "media/03 Intro Music.mp3"}
puts "Hello. Welcome to Tween!".colorize(color: :yellow, mode: :blink)
while response != 3
  puts "Enter 1 to play a new game, 2 to see the scoreboard or 3 to Exit.".colorize(color: :green)
  response = gets.chomp
  if response.to_i == 2
    Round.scoreboard
  elsif response.to_i == 1
    Game.play
  elsif response.to_i == 3
    break
  else
    puts "Invalid Input".colorize(color: :red)
  end
end
