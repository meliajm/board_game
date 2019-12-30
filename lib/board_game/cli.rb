require 'pry'

class BoardGame::CLI

    def call
        BoardGame::Scraper.new.print_games
        list_games
        user_options
    end

    def list_games
        puts "TOP 20 board games"
        @games = BoardGame::Game.all
        @games.each.with_index(1) do |g, i|
            puts "#{i}. #{g.name}: #{g.description}"
        end

    end

    def user_options 
        input = nil
        while input != "exit"
            puts "Your options are list, exit, or 1-20!!"
            input = gets.strip.downcase

            # binding.pry

            if input.to_i > 0
                puts @games[input.to_i-1].name
            # elsif input == "list"
            #     @games.each_with_index { |game, i| puts "#{i+1}. #{game}"}
            # there's a better way to look exit without saying Please...
            elsif input == "list"
                list_games
            elsif input == 'exit'
                puts "See ya!"
            end
        end
    end
end