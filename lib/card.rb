class Card
  attr_accessor :question, :acceptable_answer, :half_answer, :category, :hash, :response  #b/c no one needs to change these
  def initialize(question,acceptable_answer,half_answer,category,response)
    @hash = {question: @question = question,
             acceptable_answer: @acceptable_answer = acceptable_answer,
             half_answer: @half_answer = half_answer,
             category: @category = category,
             response: @response = response}
  end
end
