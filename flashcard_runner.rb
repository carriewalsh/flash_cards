require "./lib/turn"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"
# require "./cards.txt"
require "pry"

deck = Deck.new


# card1 = Card.new("What is the first element on the periodic table?", "hydrogen", ["hidrogen"], :chemistry)
# card2 = Card.new("What is Newton's first law?", "an object at rest stays at rest", ["inertia"], :physics)
# card3 = Card.new("What is the Latin name for a rat?", "Rattus rattus", ["rattus rattus"], :biology)
# card4 = Card.new("What is the most diverse animal phylum?", "arthropoda", ["arthropods","insects"],:biology)
# card5 = Card.new("What symbol is equal to the square root of -1?", "i", ["I"],:math)
# deck << card1
# deck << card2
# deck << card3
# deck << card4

cards = CardGenerator.new("cards.txt")
cards.create_cards
deck.card_array = cards.cards #this puts the array of cards in deck


deck.array_of_categories
round = Round.new(deck)


#i don't have a round.start. it just starts


p "Welcome to the Great Flash Card Game!!"
sleep(0.5)
puts
p "*** *** applause *** ***"
puts
sleep(1)
p "You will be answering #{deck.card_array.count} questions"
puts
p " -- if you are ever panicking and need to leave, type 'q' -- "
sleep(1)
puts
p "Ready??"
sleep(0.5)
p "Here we go!"
puts
sleep(0.5)

round.turns_loop

sleep(0.5)
p "Let's see how you did!"
sleep(1)
p "In total, you got #{round.calculate_percent_correct} percent correct!"
p "You got #{round.calculate_percent_half} percent half right."

sleep(1)
p "Specifically: "
round.print_correct_category_percents
sleep(1)
puts
p "No matter how you did, you should feel good about yourself. You have mass and take up space. You matter."
puts
