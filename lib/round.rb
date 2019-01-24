
class Round
  attr_reader :name, :deck, :score
  def initialize(name)
    @name = name
    @deck = []
    @current_card = @deck[@count]
    @score = 0
    @count = 0
  end
  def greeting #tested
    p "Welcome Player Josh, to our Quiz Game!"
  end

  def gets_deck(deck) #tested
    @deck = deck
  end

  def intro #tested
    p "This quiz has #{@deck.count} questions for you to answer."
  end

  def gets_round_started
    greeting
    gets_deck(deck)
    sleep(0.2)
    p "***   Applause   ***"
    sleep(0.2)
    intro
    p "Let's make it exciting and shuffle the deck!"
    p "*trrr* ///||\\\|///|\\ *trrr*"
    @deck.shuffle!
  end



  end
  def takes_turn
    p card.question
    p "What is your guess?"
    guess = gets.chomp
    turn = Turn.new(guess,deck[0])

    if turn.correct? == true
      @score += 1
    elsif turn.correct? == "sort of"
      @score += 0.5
    else
      @score
    end
    turn.feedback
  end

  end
