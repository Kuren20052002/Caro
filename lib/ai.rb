require_relative "player"

class AI < Player
  WOMBO_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8],
                 [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]].freeze

  def initialize(symbol) # rubocop:disable Lint/MissingSuper
    @name = "AI"
    @mode = pick_ai_difficulty
    @symbol = symbol == "X" ? "O" : "X"
  end

  def make_move
    if mode == 1
      Math.rand(10)
    else

    end
  end

  def can_i_win?
  end

  def pick_ai_difficulty
    puts "Choose AI difficulty:\n" \
         "1: Easy\n" \
         "2: Impossible"

    mode = nil
    loop do
      mode = gets.to_i
      return mode if [1, 2].include?(mode)

      puts "Invalid input, please choose again"
    end
  end
end
