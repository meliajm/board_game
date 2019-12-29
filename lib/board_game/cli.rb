require 'pry'

class BoardGame::CLI

    def call
        list_games
    end

    def list_games
        puts "TOP 20 board games"
        user_options
    end

    def user_options 
        input = nil
        @games = ["Scythe", "Cards Against Humanity", "7 Wonders"]
        while input != "exit"
            puts "Your options are list, exit, or 1-20!!"
            input = gets.strip.downcase

            # binding.pry

            if input.to_i > 0
                puts @games[input.to_i-1]
            elsif input == "list"
                @games.each_with_index { |game, i| puts "#{i+1}. #{game}"}
            # there's a better way to look exit without saying Please...
            elsif
                puts "Please enter a number, list, or exit"
            elsif input == 'exit'
                puts "See ya!"
            end
        end
    end






end