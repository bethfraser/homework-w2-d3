class Game

  attr_reader :board, :turn, :game_number

  def initialize
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end

  def place_piece(row, column)
    return puts "Invalid row or column (must be 0, 1 or 2)" if row > 2 || row < 0 || column > 2 || column < 0
    return puts "There's already a piece there!" if @board[row][column]
    current_piece = @pieces[ @turn % 2 ]
    @board[row][column] = current_piece
    
    display_board
    if has_won?(current_piece)
      puts "#{current_piece} has won!"
      self.reset
      puts "Board has been reset."
      return
    end
    @turn += 1
    if board_full?
      puts "All spaces are used! The board has now been reset."
      self.reset
    end
  end

  def display_board
    rows_display = @board.map { |row| row_to_string(row) }
    puts rows_display.join("\n_ _ _ \n")
    puts "\n"
  end

  def reset
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @turn = 0
    @pieces.reverse!
  end

  def has_won?(symbol)
    horizontal_line?(symbol, @board) || 
    # vertical_line?(symbol) || 
    horizontal_line?(symbol, @board.transpose) ||
    diagonal_line?(symbol)
  end

  def horizontal_line?(symbol, board)
    board.any? { |row| row_has_winning_line(row, symbol) }
  end

  def row_has_winning_line(row, symbol)
    row.all? { |space| space == symbol } 
  end

  # def vertical_line?(symbol)
  #   # new_board = @board.transpose
  #   horizontal_line?(symbol, @board.transpose)
  # end

  def diagonal_line?(symbol)
    # middle_piece = @board[1][1]
    # return false if middle_piece != symbol
    # top_left_bottom_right = @board[0][0] == symbol && @board[2][2] == symbol
    # top_right_bottom_left = @board[0][2] == symbol && @board[2][0] == symbol
    # top_left_bottom_right || top_right_bottom_left

    diagonal_1 = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal_2 = [@board[0][2], @board[1][1], @board[2][0]]
    return true if row_has_winning_line(diagonal_1, symbol) || row_has_winning_line(diagonal_2, symbol)
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