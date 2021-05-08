# frozen_string_literal: true

class HumanCodemaster
  def initialize
    @key_pegs = { black: 0, white: 0 }
  end

  def create_pattern(code_pegs)
    puts 'Create a pattern for the codebreaker to guess.'
    input = gets.chomp.upcase

    until input.split.all? { |num| code_pegs.include?(num) }
      puts 'Please enter a valid pattern.'
      input = gets.chomp.upcase
    end
  end
end
