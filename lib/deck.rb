require_relative 'card'

class Deck

  attr_reader :cards

  def initialize(cards = [])
    # Adds case to convert singleton card to array
    if cards.class != Array
      @cards = [cards]
    else
      @cards = cards
    end
  end

  def count
    return @cards.count
  end

  def cards_in_category(category)
    cards_found = []
    cards.each do |card|
      if card.category == category
        cards_found << card
      end
    end
    return cards_found
  end
end
