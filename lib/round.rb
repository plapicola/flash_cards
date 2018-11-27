require_relative 'deck'
require_relative 'turn'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @current_card_index += 1
    return @turns.last
  end

  def current_card
    return @deck.cards[@current_card_index]
  end

end
