require "minitest/autorun"
require "minitest/pride"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test
  def setup
    @cards = CardGenerator.new("cards.txt")
  end

  def test_card_generator_cards_exist
    assert_instance_of CardGenerator, @cards
  end

  def test_card_generator_cards_created
    @cards.create_cards

    assert_equal 4, @cards.cards.count
  end
end
