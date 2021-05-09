# frozen_string_literal: true

require_relative 'game_interface'

class Mastermind
  include GameInterface

  attr_reader :codemaster, :codebreaker, :max_rounds
  attr_accessor :current_round

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

  def play_rounds
    end_game('codemaker') if current_round >= max_rounds

    guess = codebreaker.make_guess(codemaster, current_round)
    feedback = codemaster.give_feedback(guess)

    board.add_round(display_round(feedback, guess, current_round))
    self.current_round += 1
  end
end
