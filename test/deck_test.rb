require 'minitest/autorun'
require 'minitest/pride'
require '../lib/deck'

class TestDeck < Minitest::Test

  def test_it_exists
    deck = Deck.new()
    assert_instance_of Deck, deck
  end
end
