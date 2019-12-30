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
            puts "Your options are list, exit, y for yes to knowing number of players, or 1-20!!"
            input = gets.strip.downcase

            if input.to_i > 0
                input = input.to_i
                puts ""
                puts @games[input-1].name
                puts "Board Game stats:"
                puts ""
                puts "Players: #{@games[input-1].number_of_player.delete_prefix("layers: ")}"
            
                puts "#{@games[input-1].difficulty}"
                puts @games[input-1].game_length
                puts @games[input-1].setup_time
                min_age_int = @games[input-1].minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i
                if min_age_int > 0 
                    puts "Minimum age: #{min_age_int}"
                else
                    puts @games[input-1].minimum_age
                end

            elsif input == "list"
                list_games
            elsif input == "y"
                puts "Enter number of players, 1-20"
                   
            elsif input == 'exit'
                puts "See ya!"
            end
        end
    end
end