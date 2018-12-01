require_relative './test_helper'


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

  def test_it_can_find_multiple_cards
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    card3 = Card.new("What is the meaning to life?", 42, :Philosiphy)
    card4 = Card.new("What day should one always remember?", "The fifth of November", :Movies)
    cards = [card1, card2, card3, card4]

    deck = Deck.new(cards)
    # Test for empty category
    assert_equal [], deck.cards_in_category(:Politics)
    # Test for ability to find single card
    assert_equal [card1], deck.cards_in_category(:Science)
    # Test for ability to find multiple cards
    assert_equal [card2, card4], deck.cards_in_category(:Movies)
  end
end
