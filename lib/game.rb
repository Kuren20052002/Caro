class Game
  def initialize
    @board = Board.new
  end

  def start
    create_player
    creaete_ai

    @current_player =

      turn = 1
    turn += 1 until turn > 9
  end

  private

  def create_player
    @player = Player.new
  end

  def create_ai
    @ai = AI.new(@player.symbol)
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

  def switch_player(current_player)
    if current_player == @ai
      @player
    else
      @ai
    end
  end
end
