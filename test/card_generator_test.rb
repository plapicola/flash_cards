require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards.txt'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    file = "cards.txt"
    card_generator = CardGenerator.new(file)

    assert_instance_of CardGenerator, card_generator
  end
end
