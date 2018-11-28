require_relative 'deck'
require_relative 'turn'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @current_card_index = 0
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @current_card_index += 1
    return @turns.last
  end

  def current_card
    return @deck.cards[@current_card_index]
  end

  def guesses
    return @turns
  end

  def number_correct
    count_correct = 0
    @turns.each do |turn|
      if turn.correct?
        count_correct += 1
      end
    end

    return count_correct
  end

  def percent_correct
    return number_correct / @turns.count.to_f * 100
  end

  def number_correct_by_category(category)
    count_correct = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        count_correct += 1
      end
    end
    return count_correct
  end

  def percent_correct_by_category(category)
    count_correct = 0;
    count_category = 0;
    @turns.each do |turn|
      if turn.card.category == category
        count_category += 1
        if turn.correct?
          count_correct += 1
        end
      end
    end
    return count_correct.to_f / count_category
  end


end
