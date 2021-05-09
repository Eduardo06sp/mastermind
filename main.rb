# frozen_string_literal: true

require_relative 'decoding_board'
require_relative 'human_codemaster'
require_relative 'computer_codebreaker'

def intro
  code_pegs = [1, 2, 3, 4, 5, 6]

  puts 'Welcome!'
  puts 'You may type in lower case throughout the game.'
  puts 'Would you like to be the codemaster or the codebreaker?'

  input = gets.chomp.downcase
  until %w[codemaster codebreaker].include?(input)
    puts 'Please choose "codemaster" or "codebreaker."'
    input = gets.chomp.downcase
  end

  new_board = DecodingBoard.new

  if input == 'codemaster'
    codemaster = HumanCodemaster.new
    codebreaker = ComputerCodebreaker.new(code_pegs)
  else
    codemaster = ComputerCodemaster.new
    codebreaker = HumanCodebreaker.new
  end

  pattern = codemaster.create_pattern(code_pegs)
  new_game = Mastermind.new(new_board, code_pegs, pattern, codemaster, codebreaker)
  new_game.play_rounds
end

intro
