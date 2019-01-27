class Card
  attr_reader :question, :acceptable_answer, :half_answer, :category, :hash, :response  #b/c no one needs to change these
  def initialize(question,acceptable_answer,half_answer,category,response)
    @question = question
    @acceptable_answer = acceptable_answer
    @half_answer = half_answer
    @category = category
    @response = response
  end
end

# I can initialize with (question: question, acceptable_answer: acceptable_answer, half_answer:half_answer,category:category,response:response)
