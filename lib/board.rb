# require 'player'


class Board
  LETTERS = ("a".."z").to_a
  attr_accessor :game_board
  attr_reader :col_num, :row_num

  def initialize(col_num = 10, row_num = 10)
    @col_num = col_num
    @row_num = row_num
    @game_board = build_board
  end

  def build_board
    new_board = []
    @row_num.times do
      new_board << Array.new(@col_num)
    end
    new_board
  end

   def rows
     @game_board
   end

  def print_board
     board_output = ""
     @game_board.each do |row|
       row.each_with_index do |space, index|
         if space.nil?
            if index == 0
              board_output += "|  "
            elsif index == @col_num - 1
              board_output += " |\n"
            else
              board_output += "  "
            end
         else
            if index == 0
              board_output += "|#{space} "
            elsif index == @col_num - 1
              board_output += "#{space}|\n"
            else
              board_output += "#{space} "
            end
         end
       end
     end
     bottom_row = ""
     LETTERS.each_with_index do |letter, index|
       if index + 1 <= @col_num
         bottom_row += " #{letter.capitalize}"
       end
     end
     bottom_row += " \n"
     board_output += bottom_row
  end

   # def turn(player)
   #   player = Player.new
   # end
   def letter_to_index (column)
     LETTERS.each_with_index do |letter, index|
       if letter == column
         column = index
       end
     end
     column
   end

  def add_turn(player, column)
    column = letter_to_index(column)
    @game_board.reverse_each do |row|
      if row[column].nil?
        row[column] = player
        break
      end
    end
  end

  def has_empty_spaces?
    @game_board.each do |row|
      row.each do |space|
        if space.nil?
          return true
        end
      end
    end
    return false
  end

  def column_full?(column)
    column = letter_to_index(column)
    @game_board.each_with_index do |row, index|
      if row[column].nil?
        return false
      else
        return true
      end
    end
  end
end


# my_board = Board.new(5, 5)
# my_board.build_board
#
# # my_board.add_turn("o", "e")
# # my_board.add_turn("x", "e")
# # my_board.add_turn("x", "e")
# # my_board.add_turn("x", "e")
# # my_board.add_turn("x", "e")
#
# puts "#{my_board.print_board}"
# puts my_board.column_full?("e")
