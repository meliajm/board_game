class BoardGame::Game 
    attr_accessor :name, :number_of_player, :minimum_age, :difficulty, :description, :game_length, :setup_time

    @@all = []

    def initialize
        @@all << self
    end

    def self.all 
        @@all 
    end

    def self.reset_all
        @@all.clear
    end

end

