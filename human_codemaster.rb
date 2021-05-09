# frozen_string_literal: true

class HumanCodemaster
  attr_accessor :key_pegs

  def initialize
    @key_pegs = { black: 0, white: 0 }
  end

  def create_pattern(code_pegs)
    code_peg_colors = %w[R O Y G B V]
    puts 'Create a pattern for the codebreaker to guess.'

    input = gets.chomp.upcase
    validate_pattern(input, code_pegs, code_peg_colors)
  end

  def validate_pattern(input, code_pegs, code_peg_colors)
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

  def give_feedback(guess)
    reset_key_pegs

    guess_remainder = guess
    pattern.each_with_index do |pattern_slot, index|
      if pattern_slot == guess_remainder[index]
        guess_remainder[index] = nil
        key_pegs[:black] += 1
      end
    end

    pattern_remainder = pattern.map.with_index do |pattern_slot, i|
      if guess_remainder[i].nil?
        nil
      else
        pattern_slot
      end
    end

    pattern_remainder.each do |pattern_slot|
      next if pattern_slot.nil?
      next unless guess_remainder.include?(pattern_slot)

      matching_color = guess_remainder.find_index(pattern_slot)
      guess_remainder[matching_color] = nil
      key_pegs[:white] += 1
    end

    key_pegs
  end

  def reset_key_pegs
    key_pegs[:black] = 0
    key_pegs[:white] = 0
  end
end
