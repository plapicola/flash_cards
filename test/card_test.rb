require_relative './test_helper'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end

  def test_it_has_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", card.answer
  end

  def test_it_has_a_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal :Geography, card.category
  end

  def test_it_doesnt_have_a_turn_by_default
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_nil card.turn
  end

  def test_it_can_be_paired_with_a_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal turn, card.turn
  end

end
