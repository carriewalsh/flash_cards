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
      acceptable_answers = row[:acceptable_answers]
      half_answers = row[:half_answers]
      category = row[:category]
      card = Card.new(question,acceptable_answers,half_answers,category)
      @cards << card
    end
  end
end

# cards = CardGenerator.new("cards.txt").cards
