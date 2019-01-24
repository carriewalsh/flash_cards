require "pry"

class Round
  attr_accessor :deck, :score, :count, :score
  def initialize(deck)
    @deck = deck
    @score = 0
    @count = 0
  end
  def gets_deck(deck) #tested (use count in test not length)
    @deck = deck #can i shuffle the deck here?
  end
  def current_card #tested
    @deck.card_array[@count]
  end

  def take_turn
    #binding.pry
    p current_card.question #does this need round?
    string = gets.chomp #gets answer
    turn = Turn.new(string, current_card)
    turn.guess
    if turn.feedback == true
      @score += 1
    elsif turn.feedback == "sort of"
      @score += 0.5
    elsif turn.feedback == false
      @score += 0
    end

    @count += 1
  end
  def check_score
    p @score
  end
  def turns_loop
    for card in @deck do
      take_turn
    end
    p @score
  end
end
