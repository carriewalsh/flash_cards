class Card
  attr_reader :question, :acceptable_answers, :half_answers, :category  #b/c no one needs to change these
  def inintialize(question, acceptable_answers=[], half_answers=[], category)
    @question = question
    @acceptable_answers = acceptable_answers
    @half_answers = half_answers
    @category = category
  end
end
