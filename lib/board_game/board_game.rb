class BoardGame::Game 
    attr_accessor :name, :number_of_players, :game_length, :ages, :setup_time, :difficulty, :description, :all_stats

    @@all = []

    def initialize
        @@all << self
    end

    def self.all 
        @@all 
    end

    def self.new_from_url(url)
        self.new()
    end

    def self.reset_all
        @@all.clear
    end

end