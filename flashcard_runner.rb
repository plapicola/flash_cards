require_relative './lib/card_generator'
require_relative './lib/deck'
require_relative './lib/round'


card_generator = CardGenerator.new("./lib/cards.txt")
deck = Deck.new(card_generator.cards())
round = Round.new(deck)

round.start
