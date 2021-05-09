# frozen_string_literal: true

class Mastermind
  include GameInterface

  def initialize(board, code_pegs, pattern, codemaster, codebreaker)
    @board = board
    @code_pegs = code_pegs
    @pattern = pattern
    @codemaster = codemaster
    @codebreaker = codebreaker

    @max_rounds = 12
    @current_round = 1
  end
end
