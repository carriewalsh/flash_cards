

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
    @card_array.map do |card|
      if category == card.category
        @category_array << card
      end
    end
    #return @category_array - doesn't need this
  end
end
class Card
  attr_reader :question, :acceptable_answers, :half_answers, :category  #b/c no one needs to change these
  def initialize(question, acceptable_answers=[], half_answers=[], category)
    @question = question
    @acceptable_answers = acceptable_answers
    @half_answers = half_answers
    @category = category
  end
end

deck = Deck.new
card1 = Card.new("Q","A","B",:nada)
card2 = Card.new("Q2","A2","B2",:nada)
deck << card1
deck << card2
deck.cards_in_category(:nada)
