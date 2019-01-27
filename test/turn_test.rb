require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau",["juneau", "Junaeu"], :Geography, "It's JunEAu! Did you spell it correctly?")
  end

  def test_turn_exists
    turn = Turn.new("Juneau",@card)

    assert_instance_of Turn, turn
  end


  def test_turn_accepts_answer
    turn = Turn.new("Juneau",@card)

    assert_equal "Juneau", turn.string
  end


  def test_turn_has_card
    turn = Turn.new("Juneau",@card)

    assert_equal "What is the capital of Alaska?", @card.question #is this for sure right? is it accessing the card in Turn?
  end

  def test_correct_answer_works
    turn = Turn.new("Juneau",@card)
    turn.guess
    turn.correct?

    assert turn.correct?
  end


  def test_half_answer_works
    turn = Turn.new("Junaeu",@card)
    turn.guess
    turn.correct?

    assert_equal "sort of", turn.correct?
  end

  def test_wrong_answer_works
    turn = Turn.new("New York",@card)
    turn.guess
    turn.correct?

    refute turn.correct? #this doesn't work if i put assert_equal false, turn.correct?
  end

  def test_correct_feedback
    turn = Turn.new("Juneau",@card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "You got it!", turn.feedback
  end

  def test_half_answer_feedback
    turn = Turn.new("Junaeu",@card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "Half a point! It's JunEAu! Did you spell it correctly?", turn.feedback
  end

  def test_wrong_feedback
    turn = Turn.new("asdfas",@card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "Nope. You didn't get it.", turn.feedback
  end

  def test_blank_answer_feedback
    turn = Turn.new("",@card)
    turn.guess
    turn.correct?
    turn.feedback

    assert_equal "Wait, you didn't answer..", turn.feedback
  end

end
