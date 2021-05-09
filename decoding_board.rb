# frozen_string_literal: true

# DecodingBoard initiates with an empty array
# It stores the results of rounds being played
class DecodingBoard
  attr_accessor :rounds

  def initialize
    @rounds = []
  end

  def add_round(round)
    rounds.unshift(round)
  end

  def display_board
    rounds.each { |round| puts round }
  end
end
