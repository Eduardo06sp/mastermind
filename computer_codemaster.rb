# frozen_string_literal: true

require_relative 'human_codemaster'

# ComputerCodemaster inherits from HumanCodemaster as they share similar functionality
# The only difference is that ComputerCodemaster automatically generates
# a randomized pattern
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
