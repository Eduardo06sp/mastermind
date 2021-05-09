# frozen_string_literal: true

module GameInterface
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
