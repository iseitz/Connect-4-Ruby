require'spec_helper'
require_relative '../../lib/board'

describe Board do

  it 'can be initialized with default 10 rows and columns' do
    board = Board.new
    board.build_board
    expect(board.rows.size).to eq(10)
    expect(board.rows[0].size).to eq(10)
  end

  it 'prints a board with 10 rows, 10 columns and letter row at the bottom for a 10 column board' do
    board = Board.new
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
    board = Board.new(7,6)
    board.build_board
    expect(board.rows.size).to eq(6)
    expect(board.rows[0].size).to eq(7)
  end

  it 'prints a board with 6 rows and 7 columns' do
    board = Board.new(7,6)
    board.build_board
    board_printout =
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    "|             |\n" +
    " A B C D E F G \n"
    expect(board.print_board).to eq(board_printout)
  end

  it 'places a player on the board' do
    board = Board.new
    board.build_board
    board.add_turn("x", "a")
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
    board = Board.new
    board.build_board
    board.add_turn("x", "a")
    board.add_turn("x", "a")
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
    board = Board.new
    board.build_board
    board.add_turn("o", "j")
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
    board = Board.new
    board.build_board
    board.add_turn("o", "f")
    board.add_turn("x", "f")
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
    board = Board.new
    expect(board.has_empty_spaces?).to eq(true)
  end

  it "notifies you if the column that you chose to drop your piece is full" do
    board = Board.new(5, 5)
    board.build_board
    board.add_turn("o", "e")
    board.add_turn("x", "e")
    board.add_turn("x", "e")
    board.add_turn("x", "e")
    board.add_turn("x", "e")
    expect(board.column_full?("e")).to eq(true)
  end

end
