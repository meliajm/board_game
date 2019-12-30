require 'pry'

class BoardGame::CLI

    def call
        BoardGame::Scraper.new.make_games
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
            puts ""
            puts "Your options are list, exit, or 1-20!!"
            input = gets.strip.downcase


            if input.to_i > 0
                # puts "#{@games[input.to_i-1].name} has #{@games[input.to_i-1].description}"
                puts ""
                puts @games[input.to_i-1].name
                puts "Players: #{@games[input.to_i-1].number_of_player.delete_prefix("layers: ")}"
            
                puts "#{@games[input.to_i-1].difficulty}"
                puts @games[input.to_i-1].game_length
                puts @games[input.to_i-1].setup_time
                if  @games[input.to_i-1].minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i > 0 #@games[input.to_i-1].minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i.is_a? Integer #&&
                    puts "Minimum age: #{@games[input.to_i-1].minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i}"
                else
                    puts @games[input.to_i-1].minimum_age
                end

            # binding.pry

            elsif input == "list"
                list_games
            elsif input == 'exit'
                puts "See ya!"
            end
        end
    end
end