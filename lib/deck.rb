class Deck
  attr_accessor :card_array, :category_array
  def initialize(card_array=[])
    @card_array = card_array
    @category_array = []
  end
  def <<(card)
    @card_array << card
  end
  def shuffle
    @card_array.shuffle!
  end
  def count
    @card_array.length
  end
  def cards_in_category(category)
    @card_array.each do |card|
      if category == card.category
        @category_array << card
      end
    end
    return @category_array
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
