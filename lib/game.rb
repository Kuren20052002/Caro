# this ties everything together
class Game
  attr_reader :board, :player, :ai, :current_player

  def initialize
    @board = Board.new
  end

  def play
    create_player
    create_ai
    battle
    conclude
  end

  private

  def create_player
    @player = Player.new
  end

  def create_ai
    @ai = AI.new(@player.symbol)
    @current_player = @player.symbol == "X" ? @player : @ai
    @winner = nil
  end

  def make_turn(player)
    loop do
      move = player.make_move(board)
      if board.valid_move?(move)
        board.mark(move, player.symbol)
        break
      elsif @player == player
        puts "Invalid move, please choose an empty square"
      end
    end
  end

  def battle
    9.times do
      board.display
      make_turn(@current_player)
      if board.anyone_won?
        @winner = @current_player.name
        break
      end

      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @ai ? @player : @ai
  end

  def conclude
    @board.display
    if @winner
      puts "#{@winner} won!"
    else
      puts "Good game! It's a draw."
    end
  end
end
