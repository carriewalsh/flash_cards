require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test

  def test_turn_exists
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)

    assert_instance_of Turn, turn
  end


  def test_turn_accepts_answer
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)

    assert_equal "Juneau", turn.string
  end


  def test_turn_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)

    assert_equal "What is the capital of Alaska?", card.question #is this for sure right? is it accessing the card in Turn?

  end

  def test_correct_answer_works
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)
    turn.guess
    turn.correct?

    assert turn.correct?
  end


  def test_half_answer_works
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Junaeu",card)
    turn.guess
    turn.correct?

    assert_equal "sort of", turn.correct?
  end

  def test_wrong_answer_works
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("New York",card)
    turn.guess
    turn.correct?

    refute turn.correct? #this doesn't work if i put assert_equal false, turn.correct?
  end

  def test_correct_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "You got it!", turn.feedback
  end

  def test_half_answer_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Junaeu",card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "Half a point! You were close..", turn.feedback
  end

  def test_wrong_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography)
    turn = Turn.new("Juneau",card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "Nope. You didn't get it.", turn.feedback
  end

end
