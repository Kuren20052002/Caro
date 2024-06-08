require "pry-byebug"
require_relative "lib/player"
require_relative "lib/ai"
require_relative "lib/board"
require_relative "lib/game"

caro = Game.new
caro.play
