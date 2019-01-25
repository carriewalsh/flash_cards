require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require './lib/card'

class DeckTest < MiniTest::Test

  def test_deck_exists
    deck = Deck.new

    assert_instance_of Deck, deck

  end

  def test_new_deck_is_empty
    deck = Deck.new

    assert deck.card_array.length == 0
  end


  def test_puts_cards_in_deck

    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2

    assert deck.card_array.any?
  end

  def test_cards_shuffle
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    card3 = Card.new("Q3","A3","B3",:nada3)
    card4 = Card.new("Q4","4A","B4",:nada4)
    card5 = Card.new("Q5","A5","B5",:nada5)
    card6 = Card.new("Q6","A6","B6",:nada6)
    deck << card1
    deck << card2
    deck << card3
    deck << card4
    deck << card5
    deck << card6
    assert_equal card1, deck.card_array[0]
    deck.shuffle
    refute_equal card1, deck.card_array[0] #random so only works most of the time
  end

  def test_deck_has_count
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    deck.count

    assert_equal 2, deck.count
  end

  def test_if_category_array_made
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada)
    deck << card1
    deck << card2


    assert_equal [card1, card2], deck.cards_in_category(:nada) #just had to prepend this w/ deck
  end

  def test_array_of_categories_made
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada)
    deck << card1
    deck << card2

    assert_equal [:nada, :nada], deck.array_of_categories
  end


end
