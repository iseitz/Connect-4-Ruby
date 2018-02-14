require_relative 'player'
require_relative 'board'
require_relative 'board_space'
require_relative 'game_turn'



board = Board.new
x_player = Player.new('x')
o_player = Player.new('o')
players = [x_player, o_player].shuffle

puts "Hello! Welcome to Connect-4!"
puts "Player #{x_player.symbol}, please enter your name"
x_player.add_name
puts "Player #{o_player.symbol}, please enter your name"
o_player.add_name

  if o_player.name.downcase == x_player.name.downcase
    puts "Player #{o_player.symbol}, please chose a different name"
    o_player.add_name
  end


turn_index = 0
board.build_board
puts "Lets start! Here is the board"
puts "#{board.print_board}"

while board.has_empty_spaces? && !board.winner?
  current_player = players[turn_index]
  puts "#{current_player.name.capitalize}, please enter the letter of the column where you would like to drop your piece"
  column = gets.chomp
  if column == '' || column == nil || column.length > 1
    puts "please chose the column"
    column = gets.chomp
    board.add_turn(current_player, column)
    puts "#{board.print_board}"
  elsif board.column_full?(column)
    puts "please chose a different column, this column is full"
    column = gets.chomp
    board.add_turn(current_player, column)
    puts "#{board.print_board}"
  else
    board.add_turn(current_player, column)
    puts "#{board.print_board}"
  end
  turn_index = turn_index == 0 ? 1 : 0
end

if board.winner?
  puts "#{current_player.name.capitalize} won!"
else
  puts "No more empty spaces left! Try again!"
end
