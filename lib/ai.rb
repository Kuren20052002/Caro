# this not you
class AI < Player
  WOMBO_COMBO = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8],
                 [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]].freeze
  CORNERS = [0, 2, 6, 8].freeze

  def initialize(symbol) # rubocop:disable Lint/MissingSuper
    @name = "AI"
    @mode = pick_ai_difficulty
    @symbol = symbol == "X" ? "O" : "X"
    @opponent_symbol = symbol
  end

  def make_move(board)
    current_board = board.clone
    return rand(1..9) if @mode == 1

    return handle_first_move(current_board) if current_board.give_empty_squares.length == 9 ||
                                               current_board.give_empty_squares.length == 8

    best_move = can_i_win?(current_board)
    best_move ||= should_i_block?(current_board)
    best_move ||= rand(1..9)

    best_move
  end

  private

  def pick_ai_difficulty
    puts "Choose AI difficulty:\n" \
         "1: Easy\n" \
         "2: Normal\n"

    mode = nil
    loop do
      mode = gets.to_i
      return mode if [1, 2].include?(mode)

      puts "Invalid input, please choose again"
    end
  end

  def handle_first_move(current_board)
    if @symbol == "X"
      CORNERS.sample + 1
    elsif CORNERS.any? { |corner| current_board.squares[corner] == "X" }
      5
    else
      rand(1..9)
    end
  end

  def should_i_block?(current_board)
    WOMBO_COMBO.each do |combo|
      result = winning_line?(combo, @opponent_symbol, @symbol, current_board)
      return result if result != 0
    end

    false
  end

  def can_i_win?(current_board)
    WOMBO_COMBO.each do |combo|
      result = winning_line?(combo, @symbol, @opponent_symbol, current_board)
      return result if result != 0
    end

    false
  end

  def winning_line?(combo, symbol_to_check, symbol_not_check, current_board)
    line = [current_board.squares[combo[0]], current_board.squares[combo[1]], current_board.squares[combo[2]]]
    if line.count(symbol_to_check) == 2 && !line.include?(symbol_not_check)
      index = line[line.find_index { |number| number != symbol_to_check }]
    else
      0
    end
  end
end
