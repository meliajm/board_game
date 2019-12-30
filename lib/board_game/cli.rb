# to do - make more DRY, add super/extend/include, add another class to interact with board_game

class BoardGame::CLI

    def search_difficulity_players_age(diff: "moderate", num: 3, ages: 10)
        array_games = []
        # binding.pry
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.array_num_player.include?(num) && g.difficulty.include?(diff.capitalize) && g.minimum_age.delete_prefix("Age: ").delete_suffix("+").to_i <= ages
                array_games << g.name
                
            end
        end
        array_games 
    end

    def search_number_players_array(num:)
        array_games = []
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.array_num_player.include?(num)
                array_games << g.name
            end
        end
        array_games
    end

    def search_difficulty(input:)
        input = input.capitalize
        array_games = []
        @games = BoardGame::Game.all
        @games.each do |g|
            if g.difficulty.include?(input)
                array_games << g.name
            end
        end
        array_games
    end

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
            puts "Your options are list, exit, play for search by number of players, diff for search by number of players, search, or 1-20!!"
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
            elsif input == "play"
                puts "Enter number of players, 1-20"
                num = gets.strip.to_i
                search = search_number_players_array(num: num)
                search.each { |game| puts game}
            elsif input == "diff"
                puts "Enter easy, moderate, hard"
                input = gets.strip
                search = search_difficulty(input: input)
                search.each { |game| puts game}
            elsif input == "search"
                puts "Enter easy, moderate, hard"
                input_diff = gets.strip
                puts "Enter number of players:"
                input_play = gets.strip.to_i 
                puts "Enter youngest player age"
                input_age = gets.strip.to_i
                puts ""
                search = search_difficulity_players_age(diff: input_diff, num: input_play, ages: input_age)
                search.each { |game| puts game}
            elsif input == 'exit'
                puts "See ya!"
            end
        end
    end
end