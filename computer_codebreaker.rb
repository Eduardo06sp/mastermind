# frozen_string_literal: true

class ComputerCodebreaker
  attr_accessor :possible_solutions

  def initialize(code_pegs)
    @possible_solutions = code_pegs.repeated_permutation(4).to_a
  end

  def make_guess(codemaster, pattern, round)
    if round == 1
      guess = [1, 1, 2, 2]
    else
      guess = possible_solutions[0]
    end

    feedback = codemaster.give_feedback(guess, pattern)
    feedback = feedback.clone

    possible_solutions.filter! do |possible_solution|
      simulated_feedback = codemaster.give_feedback(guess, possible_solution)

      (feedback[:black] == simulated_feedback[:black]) &&
        (feedback[:white] == simulated_feedback[:white])
    end

    guess
  end
end
