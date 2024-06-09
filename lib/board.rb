# this the grid you play on, woww
class Board
  attr_reader :squares

  WOMBO_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8],
                 [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]].freeze

  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display # rubocop:disable Metrics/AbcSize
    system "clear"
    puts "  #{squares[0]} | #{squares[1]} | #{squares[2]} \n " \
         "---|---|---\n  " \
         "#{squares[3]} | #{squares[4]} | #{squares[5]} \n " \
         "---|---|---\n  " \
         "#{squares[6]} | #{squares[7]} | #{squares[8]} \n\n"
  end

  def give_empty_squares
    squares.filter { |square| square != "X" && squares != "O" }
  end

  def mark(pos, symbol)
    squares[pos - 1] = symbol
  end

  def valid_move?(pos)
    squares[pos - 1] == pos
  end

  def anyone_won?
    WOMBO_COMBO.any? do |combo|
      [squares[combo[0]], squares[combo[1]], squares[combo[2]]].uniq.length == 1
    end
  end
end
