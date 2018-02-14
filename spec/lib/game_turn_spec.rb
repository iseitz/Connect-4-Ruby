require 'spec_helper'


describe GameTurn do
  let(:board) { Board.new }
  let(:player) { Player.new('x') }
  let(:column) { 'a' }
  let(:turn) { GameTurn.new(board, player, column) }
  let(:opposing_player) { Player.new('o') }

  it 'has a board' do
    expect(turn.board).to eq(board)
  end

  it 'has a player' do
    expect(turn.player).to eq(player)
  end

  it 'has a column index' do
    expect(turn.column).to eq(0)
  end

  context 'checking for win conditions' do
    context 'horizontally' do
      it 'does have a win if a row of 4 symbols of the same player is found' do
        winning_board = Board.new(5, 5)
        winning_board.add_turn(player, 'a')
        winning_board.add_turn(player, 'b')
        winning_board.add_turn(player, 'c')

        winning_turn = GameTurn.new(winning_board, player, 'd')
        winning_turn.take!

        expect(winning_turn).to be_winner
      end

      it 'does not have a win if a row is interrupted by another player' do
        losing_board = Board.new(6, 7)
        losing_board.add_turn(opposing_player, 'a')
        losing_board.add_turn(opposing_player, 'b')
        losing_board.add_turn(opposing_player, 'c')

        losing_turn = GameTurn.new(losing_board, player, 'd')
        losing_turn.take!

        expect(losing_turn).to_not be_winner
      end

      it 'does not have a win if an unoccupied space is found in the row' do
        losing_board = Board.new
        losing_board.add_turn(player, 'a')
        losing_board.add_turn(player, 'b')

        losing_turn = GameTurn.new(losing_board, player, 'd')
        losing_turn.take!

        expect(losing_turn).to_not be_winner
      end
    end

    context 'vertical' do
      it 'does have a win if a column of 4 symbols of the same player is found' do
        winning_board = Board.new
        3.times do
        winning_board.add_turn(player, 'b')
        end

        winning_turn = GameTurn.new(winning_board, player, 'b')
        winning_turn.take!

        expect(winning_turn).to be_winner
      end

      it 'does not have a win if a column is interrupted by another player' do
        losing_board = Board.new
        losing_board.add_turn(opposing_player, 'a')
        losing_board.add_turn(opposing_player, 'a')
        losing_board.add_turn(opposing_player, 'a')

        losing_turn = GameTurn.new(losing_board, player, 'a')
        losing_turn.take!

        expect(losing_turn).to_not be_winner
      end

      it 'does not have a win if an unoccupied space is found in the column' do
        losing_board = Board.new
        losing_turn = GameTurn.new(losing_board, player, 'a')
        losing_turn.take!
        
        expect(losing_turn).to_not be_winner
      end
    end
  end

end
