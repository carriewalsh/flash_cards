require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
<<<<<<< HEAD
require "./lib/round"
require "./lib/turn"

class RoundTest < MiniTest::Test

  def test_has_greeting
    round = Round.new("Josh")

  assert_equal "Welcome Player Josh, to our Quiz Game!", round.greeting
  end

  def round_gets_deck
=======
require "./lib/round" 
require "./lib/turn"
require "./lib/card"

class RoundTest < MiniTest::Test

  def test_round_gets_deck
    deck = Deck.new
    round = Round.new(deck)
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck(deck)

    assert round.deck.count == 2
  end

  def test_has_current_card
>>>>>>> round-simple-version
    round = Round.new("Josh")
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
<<<<<<< HEAD
    round.gets_deck

    assert round.deck.any?
  end

  def test_has_intro
    round = Round.new("Josh")
    deck = Deck.new
=======
    round.gets_deck(deck)

    assert_equal card1, round.current_card
  end

  def test_takes_turn
    skip
    deck = Deck.new
    round = Round.new(deck)
>>>>>>> round-simple-version
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck(deck)
<<<<<<< HEAD

    assert_equal "This quiz has 2 questions for you to answer.", round.intro
  end

  def test_shuffles_deck
    round = Round.new("Josh")
  end

  def test_takes_turn


  end


=======
    round.take_turn

    # assert_equal #idk how to show this worked...
  end


  def test_takes_turn_goes_to_next_card
    round = Round.new("Josh")
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck(deck)
    round.take_turn

    assert_equal card2, round.current_card
  end

  def test_finishing_round_prints_score
    round = Round.new("Josh")
    deck = Deck.new
    card1 = Card.new("Q","A","B",:nada)
    card2 = Card.new("Q2","A2","B2",:nada2)
    deck << card1
    deck << card2
    round.gets_deck(deck)
    round.turns_loop

  end

>>>>>>> round-simple-version
end
