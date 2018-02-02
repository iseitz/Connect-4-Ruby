# board
# player
# game

class Game
  def initialize
    @player_x = Player.new(name, 'X')
    @player_o =Player.new(name, 'O')
    @board = Board.new
  end



end
