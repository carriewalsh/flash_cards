require "./lib/turn"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "pry"


card1 = Card.new("What is the first element on the periodic table?", "hydrogen", ["hidrogen"], :chemistry)
card2 = Card.new("What is Newton's first law?", "an object at rest stays at rest", ["inertia"], :physics)
card3 = Card.new("What is the Latin name for a rat?", "Rattus rattus", ["rattus rattus"], :biology)
card4 = Card.new("What is the most diverse animal phylum?", "arthropoda", ["arthropods","insects"],:biology)

deck = Deck.new
deck << card1
deck << card2
deck << card3
deck << card4

round = Round.new(deck)




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
