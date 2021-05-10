# Mastermind

This project is played entirely in the terminal. Initially, the player chooses to either play as the codemaker or the codebreaker. The computer is automatically made the opponent. The computer's guessing algorithm is an implementation of the Swaszek Mastermind algorithm, guaranteed to guess correctly within 5 tries.

Rules:
* The codebreaker has 12 attempts to break the code
* The possible code pegs are: R O Y G B V
  * These letters represent the colors of the rainbow for ease of use / rememberance (with the exception of indigo)
* The pattern (i.e. the answer) must be 4 letters long

How To Play:
* [Here is a wikiHow article explaining it with the help of pictures](https://www.wikihow.com/Play-Mastermind)
* Lowercase letters are allowed
* If you are codemaster
  * Type in a 4-letter pattern for the computer to guess
  * Watch as the computer correctly guesses the pattern within 5 tries :}
* If you are codebreaker
  * You will have to type in a 4-letter guess
  * Black key pegs are represented in text
    * They indicate the number of code pegs (i.e. colors you guessed) that are the right color and in the right spot
  * White key pegs are also represented in text
    * They indicate the number of code pegs that are the correct color in the _wrong_ spot
  * You can only win if you guess the correct colors in the correct spot (i.e. get 4 black key pegs) within 12 attempts

Some of the techniques I learned include:
* Designing with **object-oriented programming** in mind
* Separating classes / modules into different classes for **code organization**
* Adding top-level **documentation** for each class / module
* Using **inheritance** to avoid duplicating code
* Using **heredocs** to display terminal interface and prevent cluttery code
* Creating **private methods** to prevent oversharing of classes
