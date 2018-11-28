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

    expected =
    [Card.new("What color is the sky?", "blue", :Science),
    Card.new("What is the top rated game of all time?", "Ocarina of Time", :Gaming),
    Card.new("What is the most played game in the world?", "League of Legends", :Gaming),
    Card.new("What was your companion in the original Pokemon game?", "Pikachu", :Gaming),
    Card.new("What system revitalized home consoles in North America?", "NES", :Gaming)]

    assert_equal card_generator.cards, expected
  end
end
