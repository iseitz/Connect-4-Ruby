class Board
  attr_accessor :game_board

   def initialize
     @game_board = build_board
   end

   def build_board
     new_board = []
     10.times do
       new_board << Array.new(10)
     end
     new_board
   end

   def print_board
     board_output = ""
     @game_board.each do |row|
       row.each_with_index do |space, index|
         if index == 0
           board_output += "|  "
         elsif index == 9
           board_output += " |\n"
         else
           # if space.nil?
           #   board_output += "  "
           # else
           #   board_output += "#{space} "
           # end
         end
       end
     end
     board_output += " A B C D E F G H I J  \n"
   end

   def turn(player)
     player = Player.new

   end

   def full?
     @game_board


end


my_board = Board.new

puts "#{my_board.print_board}"
