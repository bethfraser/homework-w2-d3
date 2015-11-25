require 'pry-byebug'
require_relative('game')
require_relative('win_checker')

win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1)

space_index = {
1=>[0,0], 
2=>[0,1],
3=>[0,2],
4=>[1,0],
5=>[1,1],
6=>[1,2],
7=>[2,0],
8=>[2,1],
9=>[2,2]
}


puts "Hi! Let's play a game of noughts and crosses. We need two players.\n
First player, what's your name?"
name = gets.chomp

puts "Hi #{name}! You will be playing with the #{game.current_piece.upcase} as Player #{game.current_piece.upcase}."

puts "Second player, what's your name?"
name_2 = gets.chomp

puts "Hi #{name_2}! You will be playing with the #{game.not_current_piece.upcase} as Player #{game.not_current_piece.upcase}."

puts "Take your turn by entering the square you want to play in - here is the board for reference:\n1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9"

puts "#{name}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name_2}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name_2}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name_2}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name_2}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])

puts "#{name_2}, which space do you choose?"
turn_1 = gets.chomp.to_i
game.turn(space_index[turn_1][0], space_index[turn_1][1])




