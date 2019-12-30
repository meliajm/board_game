require 'pry'
class BoardGame::Scraper

    def get_page
        Nokogiri::HTML(open("https://www.gamesradar.com/best-board-games/"))
    end

    def get_games 
        self.get_page.css("#article-body")
    end

    def make_games
         
        #there is probably a better way to scrap this - this is how it's getting done for now
        all_names = nil
        all_descriptions = nil
        self.get_games.each do |article|
        # doc = Nokogiri::HTML(open("https://www.gamesradar.com/best-board-games/"))
        # doc.css("#article-body").each do |article|
            all_names = article.css("h3").text
            all_descriptions = article.css("div._hawk.subtitle").text
        end
        
        all_names = all_names.split('. ')
        all_names = all_names.drop(1)
        
        all_descriptions = all_descriptions.split('T')
        all_descriptions = all_descriptions.drop(1)
       
        all_names.each.with_index(1) do |name, i|
            game = BoardGame::Game.new

            if i < 10 
                game.name = name[0...-1]
            else
                game.name = name[0...-2]
            end
            game.description = "T#{all_descriptions[i-1]}"
        end

    
    
    end

    def print_games
        self.make_games
        BoardGame::Game.all.each do |game|
          if game.name && game.name != ""
            puts "Name: #{game.name}"
            puts "Description: #{game.description}"
          end
        end
      end



end

# BoardGame::Scraper.new


#play with scraping lab to see how to get scraper "connected to" courses/games

# doc = website
        # doc.css("#article-body").each do |article_bod|
        #     game = BoardGame::Game.new
        #     game.name = article_bod.css("h3").text
        #     game.all_stats = doc.css("#article-body").first.css("p.specs__container").text
        #     game.descr = article_bod.css("div._hawk.subtitle").text
        # end

# game.number_of_players = article-bod.css("#todays-deal span.price").text.strip
    # game.game_length = article-bod.css("a.wantone").first.attr("href").strip
    # game.ages = article-bod.css("")
    # game.setup_time = article-bod.css("")
    # game.difficulty = article-bod.css("p")
    # game.price = article-bod.css("")


# binding.pry
        # game.name = doc.css(".inlinegallery.h3").text
        # "1. Pandemic2. Ticket to Ride3. Betrayal at House on the Hill4. Jaws: The Game5. Carcassonne6. Villainous7. Fallout8. Pinch 'N' Pass9. Gloomhaven10. Root11. One Night Ultimate Werewolf12. King of Tokyo13. Articulate!14. Codenames15. Blockbuster: The Game16. X-Wing Miniatures Game17. Mysterium18. Bananagrams19. Scythe 20. Cosmic EncounterTopicsRecommended\n\nGaming deals, prizes and latest news\n\n"
        # game.number_of_players = doc.css("#todays-deal span.price").text.strip
        # game.game_length = doc.css("a.wantone").first.attr("href").strip
        # game.ages = doc.css("")
        # game.setup_time = doc.css("")
        # game.difficulty = doc.css("")
        # game.price = doc.css("")
        # doc.css("#article-body").first.css("h3").text
        # doc.css("#article-body").first.css("h3._hawk subtitle p").text
        # doc.css("#article-body").first.css("div._hawk.subtitle").text
        # doc.css("#article-body").first.css("p.specs__container strong").text
        # doc.css("#article-body").first.css("p.specs__container").first.css("strong").text

        # doc.css("#article-body").first.css("p.specs__container").text



        # game