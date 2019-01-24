

class Turn
  attr_reader :string, :card #these don't need to be changed...
  def initialize(string, card)
    @string = string
    @card = card
  end
  def guess
    p "Your guess is:"
    return @string
  end
  def card
    p @card.question #needs @ sign?
  end
  def correct?
    if @string == @card.acceptable_answers
      return true
    elsif
      for option in @card.half_answers
        if @string == option
          return "sort of"
        else
        end
      end
    elsif @string != @card.acceptable_answers
      return false
    end
  end
  def feedback
    if self.correct? == true
      return "You got it!"
    elsif self.correct? == "sort of"
      return "Half a point! You were close.."
    else
      return "Nope. You didn't get it."
    end
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

card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
turn = Turn.new("Juneau",card)
