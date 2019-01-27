require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require './lib/card'

class DeckTest < MiniTest::Test
  def setup
    @deck = Deck.new
    @card1 = Card.new("Q","A","B",:nada,"!")
    @card2 = Card.new("Q2","A2","B2",:nada,"!")
    @card3 = Card.new("Q3","A3","B3",:nada3,"!")
    @card4 = Card.new("Q4","4A","B4",:nada4,"!")
    @card5 = Card.new("Q5","A5","B5",:nada5,"!")
    @card6 = Card.new("Q6","A6","B6",:nada6,"!")
    @deck << @card1
    @deck << @card2
    @deck << @card3
    @deck << @card4
    @deck << @card5
    @deck << @card6
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_new_deck_is_empty
    skip #worked before I created setup method
    assert @deck.card_array.length == 0
  end


  def test_puts_cards_in_deck
    assert @deck.card_array.any?
  end

  def test_cards_shuffle

    assert_equal @card1, @deck.card_array[0]
    @deck.card_shuffle
    refute_equal @card1, @deck.card_array[0] #random so only works most of the time
  end

  def test_deck_has_count
    @deck.count

    assert_equal 6, @deck.count
  end

  def test_if_category_array_made
    assert_equal [@card1, @card2], @deck.cards_in_category(:nada) #just had to prepend this w/ deck
  end

  def test_array_of_categories_made
    assert_equal [:nada, :nada, :nada3, :nada4, :nada5, :nada6], @deck.array_of_categories
  end
end
