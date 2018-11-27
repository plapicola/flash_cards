require 'minitest/autorun'
require 'minitest/pride'
require '../lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the meaning of life?", 42, :Philosiphy)

    turn = Turn.new(42, card)
    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is your quest?", "To find the holy grail", :movies)
    turn = Turn.new("To find the holy grail", card)
    assert_equal turn.guess, "To find the holy grail"
  end

  def test_it_has_a_card
    card = Card.new("What is the meaning to life?", 42, :Philosiphy)
    turn = Turn.new(42, card)
    assert_equal turn.card, card
  end

  def test_guesses_can_be_correct
    card = Card.new("What is the meaning to life?", 42, :Philosiphy)
    turn = Turn.new(42, card)
    assert turn.correct?
  end

  def test_guesses_can_be_incorrect
    card = Card.new("What color is the sky?", "blue", :Science)
    turn = Turn.new("Rainbow", card)
    refute turn.correct?
  end

  def test_feedback_for_correct_guess
    card = Card.new("What color is the sky?", "blue", :Science)
    turn = Turn.new("blue", card)
    assert_equal turn.feedback, "Correct!"
  end
  def test_feedback_for_incorrect_guess
    card = Card.new("What color is the sky?", "blue", :Science)
    turn = Turn.new("black", card)
    assert_equal turn.feedback, "Incorrect."
  end
end
