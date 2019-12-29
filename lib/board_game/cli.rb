class BoardGame::CLI

    def call
        list_games
    end

    def list_games
        puts "TOP 20 board games"
        user_options
        @games = ["Scythe", "Cards Against Humanity", "7 Wonders"]
    end

    def user_options 
        input = nil
        while input != "exit"
            puts "options!!!"
            input = gets.strip.downcase

            if input.to_i > 0
                puts @games[input.to_i-1]
            elsif input == "list"
                list_games
            else
                puts "Please enter a number, list, or exit"
            end
        end
    end






end