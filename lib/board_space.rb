require_relative 'player'

class BoardSpace
  attr_accessor :player

def occupied?
  !@player.nil?
end

def to_char
  if @player
    @player.symbol
  else
    ' '
  end
end


end
