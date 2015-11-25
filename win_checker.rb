class WinChecker

  def has_won?(symbol, board)
  return true if winning_line?(symbol, board) || 
  winning_line?(symbol, board.transpose) ||
  diagonal_line?(symbol, board)
  return false
  end

  def winning_line?(symbol, board)
    board.any? { |row| row_has_winning_line(row, symbol) }
  end

  def row_has_winning_line(row, symbol)
    row.all? { |space| space == symbol } 
  end

  def diagonal_line?(symbol, board)
    diagonal_1 = [board[0][0], board[1][1], board[2][2]]
    diagonal_2 = [board[0][2], board[1][1], board[2][0]]
    return true if row_has_winning_line(diagonal_1, symbol) || row_has_winning_line(diagonal_2, symbol)
  end

end