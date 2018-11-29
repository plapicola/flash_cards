class Card

  attr_reader :question,
              :answer,
              :category

  attr_accessor :turn

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
    @turn = nil
  end

end
