class BoardGame::CLI

    def call
        list_games
    end

    def list_games
        puts "TOP 20 board games"
        @games = ["Scythe", "Cards Against Humanity", "7 Wonders"]
    end

    def user_options 
        input = nil
        while input != "exit"
            puts "options!!!"

        end

    end






end