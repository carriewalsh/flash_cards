require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/round"
require "./lib/turn"

class RoundTest < MiniTest::Test

  def test_has_greeting
    round = Round.new("Josh")

  assert_equal "Welcome Player Josh, to our Quiz Game!", round.greeting
  end

  def round_gets_deck
    round = Round.new("Josh")
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck

    assert round.deck.any?
  end

  def test_has_intro
    round = Round.new("Josh")
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck(deck)

    assert_equal "This quiz has 2 questions for you to answer.", round.intro
  end

  def test_shuffles_deck
    round = Round.new("Josh")
  end

  def test_takes_turn


  end


end
