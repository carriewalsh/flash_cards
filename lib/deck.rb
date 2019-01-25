

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
  def cards_in_category(category) #tested for .each; tested for .select, tested for .map
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
      card.hash[:category]
    end
  end

end
