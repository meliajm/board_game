require "board_game/version"
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "./board_game/version"
require_relative './board_game/board_game'
require_relative './board_game/cli'
require_relative './board_game/scraper'





module BoardGame
  class Error < StandardError; end
end
