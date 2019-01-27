require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'

class CardTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", "Junaeu",:Geography, "It's JunEAu! Did you spell it correctly?")
  end

  def test_card_exists
    assert_instance_of Card, @card
  end

  def test_it_has_a_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_it_has_an_answer
    assert_equal "Juneau", @card.acceptable_answer
  end

  def test_it_has_a_category
    assert_equal :Geography, @card.category
  end
end
