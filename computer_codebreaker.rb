# frozen_string_literal: true

class ComputerCodebreaker
  attr_accessor :possible_solutions

  def initialize(code_pegs)
    @possible_solutions = code_pegs.repeated_permutation(4).to_a
  end

  def make_guess(codemaster, pattern, round)
    guess = if round == 1
              [1, 1, 2, 2]
            else
              possible_solutions[0]
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
