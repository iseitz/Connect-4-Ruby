require'player'
require'board'
require'game'

puts "Hello! Welcome to Connect-4!"
player_o = Player.new("o")
player_x = Player.new("x")
puts "Player O, #{player_o.prompt_name}"
player_o_name = gets.chomp
puts "Player X, #{player_x.prompt_name}"
player_x_name = gets.chomp
if player_o_name.downcase == player_x_name.downcase
  puts " The name #{player_o} is already taken. Player X, please choose a different name"
  player_x = gets.chomp
end

puts "Lets start!"
puts "Here is the board"
board = Board.new
board.build_board
puts "#{board.print_board}"

puts "#{player_o.name}, please enter the letter of the column where you would like to drop your piece"
column_letter = gets.chomp
if !board.column_full?(column_letter)
  board.add_turn("o", column_letter)
  puts "#{board.print_board}"
else "puts please check the choice, this column is full"
  puts "#{board.print_board}"


end
