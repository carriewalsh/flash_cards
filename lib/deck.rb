

class Deck
  attr_reader :card_array, :category_array
  def initialize(card_array=[]) #tested
    @card_array = card_array
    @category_array = []
  end
  def <<(card) #tested
    @card_array << card
  end
  def shuffle #tested
    @card_array.shuffle!
  end
  def count #tested
    @card_array.length
  end
<<<<<<< HEAD
  def cards_in_category(category) #tested for .each; tested for .select, tested for .map
    @card_array.map do |card|
      if category == card.category
        @category_array << card
      end
=======
  def cards_in_category(category) #tested for .each; tested for .select;tested for .map
    @category_array = @card_array.map do |card|
      category == card.hash[:category]
>>>>>>> round-simple-version
    end
    #return @category_array - doesn't need this
  end
end
