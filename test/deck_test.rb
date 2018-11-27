require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'
require '../lib/card'

class TestDeck < Minitest::Test

  def test_it_exists
    deck = Deck.new()
    assert_instance_of Deck, deck
  end

  def test_it_is_made_of_cards
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    card3 = Card.new("What is the meaning to life?", 42, :Philosiphy)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    assert_equal deck.cards, cards
  end

  def test_it_counts_number_of_cards
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    card3 = Card.new("What is the meaning to life?", 42, :Philosiphy)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    assert_equal 3, deck.count
  end
end
