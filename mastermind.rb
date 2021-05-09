# frozen_string_literal: true

require_relative 'game_interface'

class Mastermind
  include GameInterface

  def initialize(board, code_pegs, code_peg_colors, pattern, codemaster, codebreaker)
    @board = board
    @code_pegs = code_pegs
    @code_peg_colors = code_peg_colors
    @pattern = pattern
    @codemaster = codemaster
    @codebreaker = codebreaker

    @max_rounds = 12
    @current_round = 1
  end
end
