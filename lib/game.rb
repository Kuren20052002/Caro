class Game
  def initialize
    @board = Board.new
  end

  def start
    pick_symbol
    pick_ai_difficulty
  end

  def pick_ai_difficulty
    puts "Choose AI difficulty:\n" \
         "1: Easy\n" \
         "2: Impossible"

    mode = nil
    loop do
      mode = gets.to_i
      break if [1, 2].include?(mode)

      puts "Invalid input, please choose again"
    end

    @ai = AI.new(mode)
  end

  def pick_symbol
    puts "Choose your symbol: X or O (X plays first):"
  end
end
