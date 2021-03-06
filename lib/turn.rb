class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
    card.turn = self
  end

  def correct?
    return @guess == @card.answer
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end
end
