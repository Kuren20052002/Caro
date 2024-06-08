class Player
  attr_reader :name, :symbol

  def initialize
    @name = whats_your_name
    @symbol = what_symbol
  end

  def make_move
    print "Make a move: "
    gets.to_i
  end

  private

  def whats_your_name
    puts "What's your name?"
    loop do
      name = gets.chomp
      return name unless name == ""

      puts "Invalid input, please choose again"
    end
  end

  def what_symbol
    puts "Choose your symbol: X or O (X plays first):"
    loop do
      symbol = gets.chomp.upcase
      return symbol if %w[X O].include?(symbol)

      puts "Invalid input, please choose again"
    end
  end
end
