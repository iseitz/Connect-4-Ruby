require_relative 'board'
require_relative 'player'
require_relative 'board_space'

class GameTurn
  LETTERS = ("a".."z").to_a
  attr_reader :board
  attr_reader :player
  attr_reader :column



  def initialize(board, player, column)
    @board = board
    @player = player
    @column = letter_to_index(column)
  end

  def letter_to_index (column)
    LETTERS.each_with_index do |letter, index|
      if column == letter
        column = index
      end
    end
    column
  end

  def take!
     @board.rows.reverse_each do |row|
       if !row[column].occupied?
         row[column].player = @player
         break
       end
     end

  end


  def winner?
    horizontal_win? || vertical_win?
  end

  def horizontal_win?
    times_in_a_row = 0
    @board.rows.reverse_each do |row|
      row.each do |space|
        if space.player == @player
          times_in_a_row += 1
            return true if times_in_a_row == 4
        else
          times_in_a_row = 0
        end
      end
    end

    false
  end


  def vertical_win?
    times_in_a_column = 0
    @board.rows.reverse_each do |row|
      if row[@column].player == @player
        times_in_a_column += 1
      else
        times_in_a_column = 0
      end
      return true if times_in_a_column == 4
    end
    false
  end
end
