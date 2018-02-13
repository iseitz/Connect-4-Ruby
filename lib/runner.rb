require'player'
require'board'



board = Board.new
player_x = Player.new('x')
player_o = Player.new('o')
players = [player_x, player_o].shuffle
turn_index = 0

puts "Hello! Welcome to Connect-4!"
while board.has_empty_spaces? && !board.winner?
  current_player = players[turn_index]
  puts "Player #{current_player.character}, please enter your name"
  player_o.name = gets.chomp
puts "Player X, please enter your name"
player_x.name = gets.chomp
if player_o_name.downcase == player_x_name.downcase
  puts " The name #{player_o} is already taken. Player X, please choose a different name"
  puts"Player X name: " \bplayer_x = gets.chomp
end

puts "Lets start!"
puts "Here is the board"
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
