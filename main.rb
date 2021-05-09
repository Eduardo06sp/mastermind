# frozen_string_literal: true

require_relative 'mastermind'
require_relative 'decoding_board'
require_relative 'human_codemaster'
require_relative 'computer_codemaster'
require_relative 'computer_codebreaker'


def intro
  puts 'Welcome!'
  puts 'You may type in lower case throughout the game.'
  puts 'Would you like to be the codemaster or the codebreaker?'

  input = gets.chomp.downcase
  until %w[codemaster codebreaker].include?(input)
    puts 'Please choose "codemaster" or "codebreaker."'
    input = gets.chomp.downcase
  end

  start_new_match(input)
end

def start_new_match(input)
  code_pegs = [1, 2, 3, 4, 5, 6]
  code_peg_colors = %w[R O Y G B V]

  new_board = DecodingBoard.new

  if input == 'codemaster'
    codemaster = HumanCodemaster.new
    codebreaker = ComputerCodebreaker.new(code_pegs)
  else
    codemaster = ComputerCodemaster.new
    codebreaker = HumanCodebreaker.new
  end

  pattern = codemaster.create_pattern(code_pegs, code_peg_colors)
  new_game = Mastermind.new(new_board, code_pegs, code_peg_colors, pattern, codemaster, codebreaker)
  new_game.play_rounds
end

intro
