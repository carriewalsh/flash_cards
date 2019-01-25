class Turn
  attr_accessor :string, :card #these don't need to be changed outside
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    p "Your guess is:"
    p @string
    return @string
  end
  def card #how is this related to round?
    return @card
  end

  def correct?
    if @string == @card.hash[:acceptable_answers]
      return true
    elsif @card.hash[:half_answers].include?(@string)
      # for option in @card.hash[:half_answers]
      #   if @string == option
        return "sort of"
    else
      return false
    end
  end

  def feedback
    if self.correct? == true
      p "You got it!"
      return "You got it!"
    elsif self.correct? == "sort of"
      p "Half a point! You were close!"
      return "Half a point! You were close!"
    else
      p "Nope. You didn't get it."
      return "Nope. You didn't get it."
    end
  end
end
