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

# cards = CardGenerator.new("cards.txt")
cards = CardGenerator.new("alternate_cards.txt")
cards.create_cards
deck.card_array = cards.cards #this puts the array of cards in deck


deck.array_of_categories
round = Round.new(deck)




round.start

round.turns_loop

round.finish
