require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'


class RoundTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    card3 = Card.new("What is the meaning to life?", 42, :Philosiphy)
    cards = [card1, card2, card3]

    deck = Deck.new([cards])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    card3 = Card.new("What is the meaning to life?", "42", :Philosiphy)
    deck = Deck.new([card1, card2, card3])

    round = Round.new(deck)
    assert_equal round.deck, deck
  end

  def test_it_has_a_current_card
    card1 = Card.new("What is the ideal pet?", "cat", :Science)
    deck = Deck.new([card1])
    round = Round.new(deck)

    assert_equal round.current_card, card1
  end

  def test_it_can_take_a_turn
    card1 = Card.new("What color is the sky?", "blue", :Science)
    deck = Deck.new(card1)
    round = Round.new(deck)

    # Check for initialized array
    assert_equal round.turns, []

    turn = round.take_turn("blue")
    assert_equal round.turns, [turn]
  end

  def test_taking_a_turn_returns_a_turn_object
    card1 = Card.new("What color is the sky?", "blue", :Science)
    deck = Deck.new([card1])
    round = Round.new(deck)
    turn = round.take_turn("Blue")

    assert turn.class == Turn
  end

  def test_tuns_can_be_correct
    card1 = Card.new("What color is the sky?", "blue", :Science)
    deck = Deck.new([card1])
    round = Round.new(deck)

    assert round.take_turn("blue").correct?
  end

  def test_it_can_give_feedback_on_last_guess
    card1 = Card.new("What color is the sky?", "blue", :Science)
    deck = Deck.new([card1])
    round = Round.new(deck)

    round.take_turn("rainbow")

    assert_equal round.guesses.last.feedback, "Incorrect."
  end

  def test_it_counts_correct_guesses
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    round.take_turn("blue")
    assert_equal round.number_correct, 1
    round.take_turn("To seek the holy grail")
    assert_equal round.number_correct, 2
  end

  def test_it_tracks_percentage_correct
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    round.take_turn("blue")
    assert_equal round.percent_correct, 100.0
    round.take_turn("To learn how to type")
    assert_equal round.percent_correct, 50.0
  end

  def test_it_can_count_correct_by_category
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    round.take_turn("blue")
    round.take_turn("To seek the holy grail")
    assert_equal round.number_correct_by_category(:Science), 1
  end

  def test_it_can_determine_percent_correct_by_category
    card1 = Card.new("What color is the sky?", "blue", :Science)
    card2 = Card.new("What is your quest?", "To seek the holy grail", :Movies)
    deck = Deck.new([card1, card2])
    round = Round.new(deck)

    round.take_turn("blue")
    round.take_turn("To seek the holy grail")
    round.percent_correct_by_category(:Science)
  end

end
