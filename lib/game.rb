require 'player'
require 'board'

class Game
  def initialize
    @player_x = Player.new('X')
    @player_o =Player.new('O')
    @board = Board.new
  end



end
