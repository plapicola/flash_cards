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
end
