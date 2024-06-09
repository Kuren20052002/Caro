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

    return handle_first_move if current_board.give_empty_squares.length == 9 ||
                                current_board.give_empty_squares.length == 8

    minimax = minimax(current_board, symbol)
    minimax[:index]
  end

  private

  def pick_ai_difficulty
    puts "Choose AI difficulty:\n" \
         "1: Easy\n" \
         "2: Impossible\n"

    mode = nil
    loop do
      mode = gets.to_i
      return mode if [1, 2].include?(mode)

      puts "Invalid input, please choose again"
    end
  end

  def minimax(current_board, current_symbol)
    available_square_index = current_board.give_empty_squares
    if check_win(@symbol)
      return { score: 1 }
    elsif check_win(@opponent_symbol)
      return { score: -1 }
    elsif available_square_index.empty?
      return { score: 0 }
    end

    future_results = []
    available_square_index.each do |index|
      current_result = {}
      current_result[:index] = index - 1
      current_result[:score] = 1
      current_board.mark(index - 1, current_symbol)
      if current_symbol == @symbol
        result = minimax(current_board, @opponent_symbol)
        current_result[:score] = result.score
      elsif current_symbol == @opponent_symbol
        result = minimax(current_board, @symbol)
        current_result[:score] = result.score
      end
      current_board.mark(index - 1, index)
      future_results.push(current_result)
    end

    best_play = nil
    if current_symbol == @symbol
      best_score = -100
      future_results.each do |result|
        if result[:score] > best_score
          best_score = result[:score]
          best_play = result[:index]
        end
      end
    else
      best_score = 100
      future_results.each do |result|
        if result[:score] < best_score
          best_score = result[:score]
          best_play = result[:index]
        end
      end
    end
    future_results[best_play]
  end

  def handle_first_move
    if @symbol == "X"
      CORNERS.sample
    elsif CORNERS.any? { |corner| corner == "X" }
      4
    else
      rand(1..9)
    end
  end

  def check_win(player_symbol)
    WOMBO_COMBO.any? { |combo| (combo.include? player_symbol) && ([combo[0], combo[1], combo[2]].uniq.length == 1) }
  end
end
