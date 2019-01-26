require "pry"

class Turn
  attr_accessor :string, :card #these don't need to be changed outside
  def initialize(string, card)
    @string = string
    @card = card
  end

  def guess
    p "Your guess is: " + @string
    return @string
  end
  # def card #how is this related to round?
  #   return @card
  # end I think this is unnecessary

  def correct?
    if @string == ""
      return "no answer"
    elsif @string == @card.hash[:acceptable_answer]
      # binding.pry
      return true
    elsif @card.hash[:half_answer].include?(@string)
      # for option in @card.hash[:half_answer]
      #   if @string == option
        return "sort of"
    else
      return false
    end
  end


  def feedback
    if self.correct? == "no answer"
      p "Wait, you didn't answer.."
      return "Wait, you didn't answer.."
    elsif self.correct? == true
      p "You got it!"
      return "You got it!"
    elsif self.correct? == "sort of"
      p "Half a point! #{@card.hash[:response]}"
      return "Half a point! #{@card.hash[:response]}"
    else
      p "Nope. You didn't get it."
      return "Nope. You didn't get it."
    end
  end
end
