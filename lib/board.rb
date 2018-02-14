require_relative 'game_turn'
require_relative 'board_space'

class Board
  LETTERS = ("a".."z").to_a
  attr_accessor :game_board
  attr_reader :col_num
  attr_reader :row_num
  attr_reader :letter_to_index

  def initialize(col_num = 10, row_num = 10)
    @col_num = col_num
    @row_num = row_num
    @game_board = build_board
  end

  def build_board
    new_board = []
    @row_num.times do
      row = []
      @col_num.times do
        row << BoardSpace.new
      end
      new_board << row
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
          if index == 0
            board_output += "|#{space.to_char} "
          elsif index == @col_num - 1
            board_output += "#{space.to_char}|\n"
          else
            board_output += "#{space.to_char} "
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

  def letter_to_index (column)
     LETTERS.each_with_index do |letter, index|
       if column == letter
         column = index
       end
     end
     column
  end

  def add_turn(player, column)
      @last_turn = GameTurn.new(self, player, column)
      @last_turn.take!
  end

  def has_empty_spaces?
    @game_board.each do |row|
      row.each do |space|
        if !space.occupied?
          return true
        end
      end
    end
    return false
  end

  def column_full?(column)
    column = letter_to_index(column)
    @game_board.each do |row|
      if !row[column].occupied?
        return false
      else
        return true
      end
    end
  end

  def winner?
    if @last_turn
      @last_turn.winner?
    else
      false
    end
  end
end
