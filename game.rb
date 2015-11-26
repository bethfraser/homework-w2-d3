class Game
  attr_reader :board, :turn_number

  def initialize(win_checker)
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn_number = 0
    @win_checker = win_checker
    @score_O = 0
    @score_X = 0
  end

  def place_piece(row, column)
    return puts "Invalid row or column (must be 0, 1 or 2)" if row > 2 || row < 0 || column > 2 || column < 0
    return puts "There's already a piece there!" if @board[row][column]
    @board[row][column] = current_piece 
  end

  def current_piece
    @pieces[@turn_number % 2]
  end

  def not_current_piece
    @pieces[(@turn_number + 1) % 2]
  end

  def turn(row, column)
    place_piece(row, column)
    display_board 
    check_for_win
  end

  def check_for_win
    if @win_checker.has_won?(current_piece, @board)
      puts "#{current_piece} has won!"
      score_increase(current_piece)
      self.reset
      puts "Board has been reset."
    elsif board_full?
      puts "All spaces are used - draw! The board has now been reset."
      self.reset
    else
      @turn_number += 1
    end
  end

  def display_board
    rows_display = @board.map { |row| row_to_string(row) }
    puts rows_display.join("\n_ _ _ \n")
    puts "\n"
  end

  def reset
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @turn_number = 0
    # @pieces.reverse!
  end

  def score_increase(symbol)
    @score_O += 1 if symbol == :o
    @score_X += 1 if symbol == :x
  end

  def display_scoresheet
    score_hash = { "Player X"=>@score_X, "Player O"=>@score_O}
    score_hash = score_hash.sort
    highest_score = score_hash[-1]
    puts "Scoresheet:\nPlayer X: #{@score_X}\nPlayer O: #{@score_O}\nCurrent Leader: #{highest_score}"
  end
 
  private 

  def board_full?
    @board.flatten.all?
  end

  def row_to_string(row)
    row_symbols = row.map do |piece|
      piece || " "
    end
    row_symbols.join("|")
  end
end