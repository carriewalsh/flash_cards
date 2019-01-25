require "pry"

class Round
  attr_accessor :deck, :score, :count, :score, :string, :correct_cards, :half_cards, :wrong_cards
  def initialize(deck)
    @deck = deck
    @score = 0
    @count = 0
    @correct_cards = []
    @half_cards = []
    @wrong_cards = []
  end
  # def gets_deck(deck) #tested (use count in test not length)
  #   @deck = deck #can i shuffle the deck here?
  # end
  def current_card #tested
    @deck.card_array[@count]
  end

  def take_turn
    p current_card.question #does this need round?
    @string = gets.chomp #gets answer
    turn = Turn.new(@string, current_card)
    turn.guess
    if @string == "q"
      quit_round
    elsif turn.correct? == true
      @score += 1
      @correct_cards << current_card
      @count += 1
      return turn.feedback
    elsif turn.correct? == "sort of"
      @score += 0.5
      @half_cards << current_card
      @count += 1
      return turn.feedback
    elsif turn.correct? == false
      @score += 0
      @wrong_cards << current_card
      @count += 1
      return turn.feedback
    end

  end
  def check_score
    p @score
  end

  def turns_loop
    @deck.card_array.each do
      take_turn
      #p @score
      puts
      puts
    end
  end

  def quit_round #tested
    p "It's okay, we all have bad days."
    exit!
    return "end"
  end

  def calculate_percent_correct
    total = @correct_cards + @half_cards + @wrong_cards
    percent = (100 * @correct_cards / total).round
    return "#{percent}%"
  end
  def calculate_percent_half
    total = @correct_cards + @half_cards + @wrong_cards

    percent = (100 * @half_cards / total).round
    return "#{percent}%"
  end

  def category_percent_correct
    @deck.hash[:category].uniq.each do |x|
      total = @deck.cards_in_category(x).count
      correct = 0
      if @correct_cards.hash[:category] == x
        correct += 1
      end
      percent = (100 * correct / total).round
      p "You got #{percent} of #{:category} correct."
    end

  end
  #I want to make correct answer-ness a state of each card so I can access it more easily.

end
