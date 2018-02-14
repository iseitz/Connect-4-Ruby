class Player
  attr_reader :symbol
  attr_accessor :name

  def initialize(symbol)
    @name = ""
    @symbol = symbol
  end

  def add_name
    @name = gets.chomp
    @name
  end

end
