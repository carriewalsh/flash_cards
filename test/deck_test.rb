require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/turn'
require './lib/card'

class DeckTest < MiniTest::Test
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


end
