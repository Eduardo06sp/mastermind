# frozen_string_literal: true

class HumanCodemaster
  def initialize
    @key_pegs = { black: 0, white: 0 }
  end

  def create_pattern(code_pegs)
    puts 'Create a pattern for the codebreaker to guess.'
    input = gets.chomp.upcase
    input_array = input.split('').map(&:to_i)

    until input_array.length == 4 &&
          input_array.all? { |num| code_pegs.include?(num) }
      puts 'Please enter a valid pattern.'
      input = gets.chomp.upcase
      input_array = input.split('').map(&:to_i)
    end
  end
end
