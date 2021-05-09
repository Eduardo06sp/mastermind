# frozen_string_literal: true

require_relative 'game_interface'

class Mastermind
  include GameInterface

  attr_reader :board, :code_pegs, :code_peg_colors, :pattern, :codemaster, :codebreaker, :max_rounds
  attr_accessor :current_round

  def initialize(board, code_pegs, code_peg_colors, pattern, codemaster, codebreaker)
    @board = board
    @code_pegs = code_pegs
    @code_peg_colors = code_peg_colors
    @pattern = pattern
    @codemaster = codemaster
    @codebreaker = codebreaker

    @max_rounds = 12
    @current_round = 1
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

  def play_rounds
    end_game('codemaker') if current_round >= max_rounds

    if codebreaker.instance_of?(ComputerCodebreaker)
      guess = codebreaker.make_guess(codemaster, pattern, current_round)
    else
      guess = codebreaker.make_guess(code_pegs, code_peg_colors)
    end

    feedback = codemaster.give_feedback(guess, pattern)

    board.add_round(display_round(feedback, guess, current_round))
    puts display_round_header(current_round)
    board.display_board

    end_game('codebreaker') if feedback[:black] == 4

    self.current_round += 1
    play_rounds
  end

  def end_game(winner)
    if winner == 'codebreaker'
      puts 'The codebreaker wins!'
    else
      puts 'The codemaster has won!'
    end

    rematch
  end

  def rematch
    puts 'Rematch?'
    input = gets.chomp.downcase

    until %w[yes no y n].include?(input)
      puts 'Please put yes/y/no/n.'
      input = gets.chomp.downcase
    end

    if %w[yes y].include?(input)
      puts 'Would you like to be the codemaster or codebreaker?'
      input = gets.chomp.downcase

      until %w[codemaster codebreaker].include?(input)
        puts "Please enter 'codemaster' or 'codebreaker'."
        input = gets.chomp.downcase
      end

      start_new_match(input)
    else
      puts 'Have a wonderful day! Thanks for playing. :}'
      exit
    end
  end
end
