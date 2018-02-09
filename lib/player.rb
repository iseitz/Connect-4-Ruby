class Player

  attr_reader :symbol
  attr_accessor :name
  def initialize(symbol)
    @name = ""
    @symbol = symbol
  end

  def prompt_name
    puts "What is your name?"
    @name = gets.chomp
  end

end
