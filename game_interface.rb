# frozen_string_literal: true

# GameInterface contains the methods that generate
# what will be displayed in the terminal
#
# It does not actually output it to the terminal,
# instead these methods are used to add onto the DecodingBoard's
# rounds array, the class which outputs all rounds to the terminal
module GameInterface
  private

  def display_round_header(current_round)
    <<-HEREDOC
    --------------------------------------------------------------
                               ROUND #{current_round}
    HEREDOC
  end

  def display_round(feedback, guess, current_round)
    colors = pattern_to_colors(guess)

    <<-HEREDOC
    --------------------------------------------------------------
                Key Pegs                 Guess ##{current_round}
            Black: #{feedback[:black]}  White: #{feedback[:white]}         #{colors[0]}   #{colors[1]}   #{colors[2]}   #{colors[3]}
    --------------------------------------------------------------
    HEREDOC
  end

  def pattern_to_colors(pattern)
    pattern.map { |num| code_peg_colors[num - 1] }
  end
end
