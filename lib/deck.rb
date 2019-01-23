class Deck
  attr_accessor :card_array
  def initialize(card_array=[])
    @card_array = card_array
  end
  def <<(card)
    @card_array << card
  end
  def shuffle
    @card_array.shuffle!
  end
end
