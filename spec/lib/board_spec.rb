require 'spec_helper'
# require_relative '../../lib/board'

describe Board do
  let (:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:opposing_player) { Player.new('o') }
  
  it 'can be initialized with default 10 rows and columns' do
    board.build_board
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  it 'prints a board with 10 rows, 10 columns and letter row at the bottom for a 10 column board' do
    board.build_board
    board_printout =
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    " A B C D E F G H I J \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'can be initialized with 6 rows and 7 columns' do
    my_board = Board.new(7,6)
    my_board.build_board
    expect(my_board.rows.size).to eq(6)
    expect(my_board.rows[0].size).to eq(7)
  end

  it 'prints a board with 6 rows and 7 columns' do
    my_board = Board.new(7,6)
    my_board.build_board
    board_printout =
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    " A B C D E F G \n"
    expect(my_board.print_board).to eq(board_printout)
  end

  it 'places a player on the board' do
    board.build_board
    board.add_turn(player, "a")
    board_printout =
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|x                  |\n" +
    " A B C D E F G H I J \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'places the symbol one row above if the previous spot is already taken on the board' do
    board.build_board
    board.add_turn(player, "a")
    board.add_turn(player, "a")
    board_printout =
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|x                  |\n" +
    "|x                  |\n" +
    " A B C D E F G H I J \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'places a player on the further right size of the board if the spot is chosen' do
    board.build_board
    board.add_turn(opposing_player, "j")
    board_printout =
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                  o|\n" +
    " A B C D E F G H I J \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'places a player in the middle of the board if the spot is chosen' do
    board.build_board
    board.add_turn(opposing_player, "f")
    board.add_turn(player, "f")
    board_printout =
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|                   |\n" +
    "|          x        |\n" +
    "|          o        |\n" +
    " A B C D E F G H I J \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'creates a board with empty spaces that can be taken' do
    expect(board.has_empty_spaces?).to eq(true)
  end

  it 'has no empty spaces if all spots are taken' do
    my_board = Board.new(3,3)
    3.times do |index|
      3.times do |column|
        my_board.add_turn(player, column)
      end
    end
    expect(my_board.has_empty_spaces?).to eq(false)
  end

  it "notifies you if the column that you chose to drop your piece is full" do
    my_board = Board.new(5, 5)
    my_board.build_board
    my_board.add_turn(player, 'b')
    my_board.add_turn(player, 'b')
    my_board.add_turn(opposing_player, 'b')
    my_board.add_turn(player, 'b')
    my_board.add_turn(player, 'b')
    expect(my_board.column_full?('b')).to eq(true)
  end

end
