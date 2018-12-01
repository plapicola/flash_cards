require_relative 'turn'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    return @turns.last
  end

  def start
    print_welcome_message
    play_game
    print_outcomes
  end

  def print_welcome_message
    puts "Welcome! You're playing with #{@deck.cards.count} cards."
    puts "#{"-" * 40}"
  end

  def play_game
    until @deck.cards.count == @turns.count
      puts "This is card #{turns.count + 1} of #{@deck.cards.count}"
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      new_turn = take_turn(guess)
      puts "#{new_turn.feedback}"
    end
  end

  def print_outcomes
    puts "#{"*" * 6} Game Over! #{"*" * 6}"
    puts "You had #{number_correct} correct guesses of #{@deck.cards.count}"
    print_category_outcomes
  end

  def print_category_outcomes
    categories = get_categories
    categories.each do |category|
      puts "#{category.to_s} - #{percent_correct_by_category(category)}% correct"
    end
  end

  # Helper for print_category_outcomes, aggregates a list of all categories present
  def get_categories
    @deck.cards.inject([]) do |categories, card|
      categories.include?(card.category) ? categories : categories << card.category
    end
  end

  def current_card
    return @deck.cards[@turns.count]
  end

  def number_correct
    @turns.inject(0) do |count, turn|
      turn.correct? ? count += 1 : count
    end
  end

  # Added default values to re-use calculation for other percentage methods
  def percent_correct(values = {correct: number_correct, count: @turns.count})
    if values[:correct] != 0
      return (values[:correct] / values[:count].to_f * 100).round(2)
    end
    return 0.0
  end

  def number_correct_by_category(category)
    count_correct = 0
    cards_in_category = @deck.cards_in_category(category)
    cards_in_category.each do |card|
      if card.turn != nil && card.turn.correct?
        count_correct += 1
      end
    end
    return count_correct
  end

  def percent_correct_by_category(category)
    cards_in_category = @deck.cards_in_category(category)

    values = {correct: 0, count: 0}

    cards_in_category.each do |card|
      if card.turn != nil
        values[:count] += 1
        if card.turn.correct?
          values[:correct] += 1
        end
      end
    end
    return percent_correct(values)
  end


end
