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
    p "Question #{@count+1}: " + current_card.question #does this need round?
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
    total = @correct_cards.count + @half_cards.count + @wrong_cards.count
    percent = (100 * @correct_cards.count / total).round
    return percent
  end

  def calculate_percent_half
    total = @correct_cards.count + @half_cards.count + @wrong_cards.count

    percent = (100 * @half_cards.count / total).round
    return percent
  end

  def category_percent_correct(category) #test works
      total = @deck.cards_in_category(category).count
      correct = 0
      @correct_cards.each do |card|
        if card.hash[:category] == category
          correct += 1
        end
      end
      percent = (100 * correct / total).round.to_s
      p "You got #{percent} percent of #{category} questions correct."
    return "You got #{percent} percent of #{category} questions correct."
  end

  def category_percent_half(category) #test works
      total = @deck.cards_in_category(category).count
      correct = 0
      @half_cards.each do |card|
        if card.hash[:category] == category
          correct += 1
        end
      end
      percent = (100 * correct / total).round.to_s
      p "You got #{percent} percent of #{category} questions half right."
    return "You got #{percent} percent of #{category} questions half right."
  end


  def print_correct_category_percents
    correct = @deck.category_array.uniq
    correct.map do |x|
      category_percent_correct(x)
    end
    half = @deck.category_array.uniq
    half.map do |x|
      category_percent_half(x)
    end
  end

end
