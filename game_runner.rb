require 'pry-byebug'
require_relative('game')

# Create game
game = Game.new()


# Place piece
game.place_piece(0,0)

# Display game board
game.display_board

# Restart game / reset board
game.reset
puts "Game board has been reset\n"

game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)


puts game.has_won?(:o)



#To Do
# don't allow putting pieces out of range
# rotate the starting piece when resetting
# automatically reset when board is full and tell us it's a draw
# Detect when someone has won and notify




binding.pry;''