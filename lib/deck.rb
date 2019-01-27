class Deck
  attr_accessor :card_array  #this is edited outside this class
  attr_reader :category_array
  def initialize #tested
    @card_array = []
    @category_array = []
  end
  def <<(card) #tested
    @card_array << card
  end
  def card_shuffle #tested
    @card_array.shuffle!
  end
  def count #tested
    @card_array.length
  end
  def cards_in_category(category) #tested for .each; tested for .select; tested for .map
    cat_array = []
    @card_array.map do |card|
      if category == card.category
        cat_array << card
      end
    end
    return cat_array
  end

  def array_of_categories
    @category_array = @card_array.map do |card|
      card.category
    end
  end

end
