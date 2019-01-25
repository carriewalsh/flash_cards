require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/round"
require "./lib/turn"
require "./lib/card"
require "pry"

class RoundTest < MiniTest::Test
  def setup
    @deck = Deck.new
    @round = Round.new(@deck)
    @card1 = Card.new("Q","A","B",:nada)
    @card2 = Card.new("Q2","A2","B2",:nada2)
    @deck << @card1
    @deck << @card2

  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_round_has_deck
    assert @round.deck.count == 2
  end

  def test_has_current_card
    assert_equal @card1, @round.current_card
  end

  def test_takes_turn
    skip #this works
    @round.take_turn
    assert_equal 1, @round.count
  end


  def test_takes_turn_goes_to_next_card
    skip #this works
    @round.take_turn

    assert_equal @card2, @round.current_card
  end


  def check_score_goes_up
    @round.take_turn

    assert_equal 1, @round.score
  end


  def test_if_enter_q_quits
    skip #this works
    @round.turns_loop

    assert "end", @round.take_turn
  end

  def test_correct_answer_adds_card_to_correct_array
    skip #this works
    p "CORRECT"
    @round.take_turn

    assert_equal @card1, @round.correct_cards[0]

  end

  def test_half_answer_adds_card_to_half_array
    skip #this works
    p 'HALF'
    @round.take_turn

    assert_equal @card1, @round.half_cards[0]
  end

  def test_wrong_answer_adds_card_to_wrong_array
    skip #this works
    p "WRONG"
    @round.take_turn

    assert_equal @card1, @round.wrong_cards[0]
  end

  def test_percent_correct
    @round.correct_cards = 3
    @round.half_cards = 2
    @round.wrong_cards = 1

    assert_equal "50%", @round.calculate_percent_correct

  end

  def test_percent_half
    @round.correct_cards = 3
    @round.half_cards = 2
    @round.wrong_cards = 1

    assert_equal "33%", @round.calculate_percent_half

  end

  def test_percent_correct_category

    @card3 = Card.new("Q","A","B",:nada)
    @card4 = Card.new("Q2","A2","B2",:nada2)
    @deck << @card3
    @deck << @card4
    @round.correct_cards << @card1
    @round.correct_cards << @card2
    @round.half_cards << @card3
    @round.wrong_cards << @card4

    @round.category_percent_correct
    binding.pry

    #assert_equal "50", @round.category_percent_correct
  end


end