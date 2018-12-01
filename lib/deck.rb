class Deck

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def count
    return @cards.count
  end

  def cards_in_category(category)
    cards.find_all {|card| card.category == category}
  end
end
