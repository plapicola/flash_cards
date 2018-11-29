require_relative 'deck'
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

  def get_categories
    categories = []
    @deck.cards.each do |card|
      if !categories.include?(card.category)
        categories << card.category
      end
    end
    return categories
  end

  def current_card
    return @deck.cards[@turns.count]
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

  # Added default values to re-use calculation for other percentage methods
  def percent_correct(num_correct = number_correct, num_turns = @turns.count)
    if num_turns != 0
      return num_correct / num_turns.to_f * 100
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
    count_correct = 0;
    count_category = 0;

    cards_in_category.each do |card|
      if card.turn != nil
        count_category += 1
        if card.turn.correct?
          count_correct += 1
        end
      end
    end


    return percent_correct(count_correct, count_category)

  end


end
