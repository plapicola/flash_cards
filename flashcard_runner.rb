require_relative './lib/card_generator'
require_relative './lib/deck'
require_relative './lib/round'



# card1 = Card.new("What color is the sky?", "blue", :Science)
# card2 = Card.new("What is the top rated game of all time?", "Ocarina of Time", :Gaming)
# card3 = Card.new("What is the most played game in the world?", "League of Legends", :Gaming)
# card4 = Card.new("What was your companion in the original Pokemon game?", "Pikachu", :Gaming)
# card5 = Card.new("What system revitalized home consoles in North America?", "NES", :Gaming)
#
# deck = Deck.new([card1, card2, card3, card4, card5])
card_generator = CardGenerator.new("./lib/cards.txt")
deck = Deck.new(card_generator.cards())
round = Round.new(deck)

round.start
