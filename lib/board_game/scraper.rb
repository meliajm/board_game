class BoardGame::Scraper

    def website
        Nokogiri::HTML(open("https://www.gamesradar.com/best-board-games/"))
    end

    def scrape_game_index
        self.website.css("")
    end

    def game_info

    end


end