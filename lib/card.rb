class Card
  attr_reader :question, :acceptable_answers, :half_answers, :category, :hash  #b/c no one needs to change these
  def initialize(question,acceptable_answers,half_answers,category)
    @hash = {question: @question = question,
             acceptable_answers: @acceptable_answers = acceptable_answers,
             half_answers: @half_answers = half_answers,
             category: @category = category}
  end
end
