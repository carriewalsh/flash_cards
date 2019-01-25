require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"
require "cards.txt"

class CardGeneratorTest < Minitest :: Test
  def test_card_generator_cards_exist
    cards = CardGenerator.new("cards.txt").cards

    assert_equal ["What is the first element on the periodic table?", "hydrogen", ["hidrogen"], :chemistry,
    "What is Newton's first law?", "an object at rest stays at rest", ["inertia"], :physics,
    "What is the Latin name for a rat?", "Rattus rattus", ["rattus rattus"], :biology,
    "What is the most diverse animal phylum?", "arthropoda", ["arthropods","insects"],:biology]

  end



end
