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

puts "Testing to see if horizontal line wins:"
game.place_piece(0,0)
game.place_piece(1,1)
game.place_piece(0,1)
game.place_piece(2,2)
game.place_piece(0,2)

puts "Testing to see if vertical line wins:"
game.place_piece(0,0)
game.place_piece(1,1)
game.place_piece(1,0)
game.place_piece(1,2)
game.place_piece(2,0)

puts "Testing to see if diagonal line wins:"
game.place_piece(0,0)
game.place_piece(1,0)
game.place_piece(1,1)
game.place_piece(1,2)
game.place_piece(2,2)






#To Do
# don't allow putting pieces out of range
# rotate the starting piece when resetting
# automatically reset when board is full and tell us it's a draw
# Detect when someone has won and notify




# binding.pry;''