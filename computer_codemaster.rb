# frozen_string_literal: true

require_relative 'human_codemaster'

class ComputerCodemaster < HumanCodemaster
  def create_pattern(code_pegs, _colors)
    pattern = []

    4.times do
      random_code_peg = code_pegs.sample
      pattern.push(random_code_peg)
    end

    pattern
  end
end
