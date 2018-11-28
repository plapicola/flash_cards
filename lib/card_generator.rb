require_relative './card'

class CardGenerator

  def initialize(file)
    @file = file
  end

  def cards
    lines_in_file = IO.readlines(@file)
    cards = []
    lines_in_file.each do |line|
      line = line.chomp
      card_properties = line.split(",")
      cards << Card.new(card_properties[0], card_properties[1], card_properties[2].to_sym)
    end
    return cards
  end
end
