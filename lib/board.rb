class Board
  attr_reader :board

  WOMBO_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  end

  def display
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n" +
         "---|---|---\n" +
         " #{board[3]} | #{board[4]} | #{board[5]} \n" +
         "---|---|---\n" +
         " #{board[6]} | #{board[7]} | #{board[8]} \n" 
  end

  def mark(pos, symbol)
    board[pos - 1] = symbol
  end

  def valid_move?(pos)
    board[pos - 1] == pos
  end

  def anyone_won?
    WOMBO_COMBO.any? do |combo|
      [board[combo[0]], board[combo[1]], board[combo[2]]].uniq.length == 1
    end
  end
end
