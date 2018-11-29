require 'minitest/autorun'
require 'minitest/pride'
# require './lib/cards.txt'
require './lib/card_generator.rb'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    file = "./lib/cards.txt"
    card_generator = CardGenerator.new(file)

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_returns_an_array_of_cards
    file = "./lib/cards.txt"
    card_generator = CardGenerator.new(file)
    generated_cards = card_generator.cards

    assert_instance_of Array, generated_cards
    assert_equal 5, generated_cards.length
    assert_instance_of Card, generated_cards.first
    assert_instance_of Card, generated_cards.last
    assert_equal "blue", generated_cards.first.answer
    assert_equal :Science, generated_cards.first.category
    assert_equal :Gaming, generated_cards.last.category
    assert_equal "What system revitalized home consoles in North America?", generated_cards.last.question
  end
end
