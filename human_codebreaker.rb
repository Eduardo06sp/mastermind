# frozen_string_literal: true

require_relative 'human_codemaster'

# HumanCodebreaker uses methods from HumanCodemaster
# so it inherits from the aforementioned
#
# The main difference is that a (human) codebreaker needs to input guesses,
# while a codemaster does not
class HumanCodebreaker < HumanCodemaster
  def make_guess(code_pegs, code_peg_colors)
    puts 'Make a guess!'
    display_valid_code_pegs(code_peg_colors)
    input = gets.chomp.upcase
    validate_pattern(input, code_pegs, code_peg_colors)
  end
end
