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

    @board[row][column] = @pieces[ @turn % 2 ]
    # To decide which of the pieces to use, the current value of turn is divided by 2 and the remainder returned - this will always be 0 or 1, which corresponds to the two indexes of O and X. Turn is then increased by 1 so that on the next turn the remainder will be the other value (0 or 1).
    @turn += 1
    display_board
    if board_full?
      puts "All spaces are used! The board has now been reset."
      self.reset
    end
  end

  def display_board
    rows_display = @board.map { |row| row_to_string(row) }
    puts rows_display.join("\n_ _ _ \n")
  end

  def reset
    @board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
    @turn = 0
    @pieces.reverse!
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