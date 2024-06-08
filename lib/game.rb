class Game
  def initialize
    @board = Board.new
  end

  def start
    create_player
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

  def create_player
    @player = Player.new
  end

  def make_turn(player)
    loop do
      move = player.make_move
      if board.valid_move?(move)
        board.mark(move, player.symbol)
      elsif @player == player
        puts "Invalid move, please choose an empty square"
      end
    end
  end
end
