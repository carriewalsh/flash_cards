# require "./cards.txt"
require "./lib/card"
require "csv"
require "pry"

filename = "cards.txt"


class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def create_cards
    contents = CSV.open filename, headers:true, header_converters: :symbol
    contents.each do |row|
      card = row[:card]
      question = row[:question]
      acceptable_answer = row[:acceptable_answer]
      half_answer = row[:half_answer]
      category = row[:category]
      response = row[:response]
      card = Card.new(question,acceptable_answer,half_answer,category,response)
      @cards << card
    end
  end
end

# cards = CardGenerator.new("cards.txt").cards
