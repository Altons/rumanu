# frozen_string_literal: true

module Rumanu
  # Pythagoras alphabet
  VOWELS = { 'a' => 1, 'á' => 1, 'e' => 5, 'é' => 5, 'i' => 9,
             'í' => 9, 'o' => 6, 'ó' => 6, 'u' => 3, 'ú' => 3, 'ü' => 3 }.freeze

  CONSONANTS = { 'b' => 2, 'c' => 3, 'd' => 4, 'f' => 6, 'g' => 7,
                 'h' => 8, 'j' => 1, 'k' => 2, 'l' => 3, 'm' => 4, 'n' => 5,
                 'p' => 7, 'q' => 8, 'r' => 9, 's' => 1, 't' => 2, 'v' => 4,
                 'w' => 5, 'x' => 6, 'y' => 7, 'z' => 8 }.freeze
end
