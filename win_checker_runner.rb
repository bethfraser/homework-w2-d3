require_relative('win_checker')

win_checker = WinChecker.new()

empty_board = [ [nil, nil, nil],[nil, nil, nil],[nil, nil, nil] ]
symbol = :o

puts "Check that empty board does not win: #{win_checker.has_won?(symbol, empty_board)} (expect false)"

horizontal_board = [ [:o, :o, :o],[nil, nil, nil],[nil, nil, nil] ]
symbol = :o

puts "Check that horizontal line wins: #{win_checker.has_won?(symbol, horizontal_board)} (expect true)"

vertical_board = [ [:o, nil, nil],[:o, nil, nil],[:o, nil, nil] ]
symbol = :o

puts "Check that vertical line wins: #{win_checker.has_won?(symbol, vertical_board)} (expect true)"

diagonal_board = [ [:o, nil, nil],[nil, :o, nil],[nil, nil, :o] ]
symbol = :o

puts "Check that diagonal line wins: #{win_checker.has_won?(symbol, diagonal_board)} (expect true)"