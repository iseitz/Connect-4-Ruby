class Player
  attr_reader :symbol
  attr_accessor :name

  def initialize(symbol)
    @name = ""
    @symbol = symbol
    @player_names =[]
  end

  def prompt_name
    puts "What is your name?"
    @name = gets.chomp
    if name.size <= 1 || player_names.include?(@name.downcase)
      puts "Please secify a proper name"
      @name = gets.chomp
    end
    @player_names << @name.downcase
    @name
  end

end
