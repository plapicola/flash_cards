class Deck

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
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
