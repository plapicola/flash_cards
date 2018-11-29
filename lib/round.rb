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
    return @deck.cards[@current_card_index]
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

    # Check for divide by 0
    if (count_category != 0)
      return count_correct.to_f / count_category * 100
    end
    return 0.0;
  end


end
