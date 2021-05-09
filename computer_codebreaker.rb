# frozen_string_literal: true

# ComputerCodebreaker is an implementation of the Mindmaster algorithm by Swaszek
# A list of possible solutions is created
#
# Then the list of possible solutions is reduced by simulating plays,
# eliminating possibilities that would not yield the same number of key pegs
#
# The first guess is [1, 1, 2, 2]
# Then subsequent guesses are the first possibility from the remaining solutions
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
