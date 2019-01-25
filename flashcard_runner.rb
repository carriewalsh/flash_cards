require "./lib/turn"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"
require "cards.txt"
require "pry"



cards = CardGenerator.new("cards.txt").cards
deck = Deck.new
deck << cards
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
p "You got #{round.calculate_percent_half} half right."

sleep(1)
p "Specifically: "
round.print_correct_category_percents
sleep(1)

p "No matter how you did, you should feel good about yourself because you "
