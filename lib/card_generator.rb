require "./cards.txt"
filename = "cards.txt"

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def cards
    File.open(@filename).each do |line|
      @cards << line
    end
    return @cards
  end
end

# cards = CardGenerator.new("cards.txt").cards
