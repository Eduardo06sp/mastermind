# frozen_string_literal: true

class HumanCodemaster
  def initialize
    @key_pegs = { black: 0, white: 0 }
  end

  def create_pattern(code_pegs)
    code_peg_colors = %w[R O Y G B V]

    puts 'Create a pattern for the codebreaker to guess.'
    input = gets.chomp.upcase
    input_array = input.split('')
    input_to_num = color_to_num(input_array, code_peg_colors)

    until input_array.all? { |color| code_peg_colors.include?(color) } &&
          input_to_num.length == 4 &&
          input_to_num.all? { |num| code_pegs.include?(num) }
      puts 'Please enter a valid pattern.'
      input = gets.chomp.upcase
      input_array = input.split('')
      input_to_num = color_to_num(input_array, code_peg_colors)

      p input_to_num
    end
  end

  def color_to_num(colors, code_peg_colors)
    colors.map do |color|
      color_location = code_peg_colors.find_index(color)

      color_location && color_location + 1
    end
  end
end
