# computes Scrabble score for a given word
class Scrabble
  POINT_VALUE = { 'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1,
                  'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1, 'D' => 2, 'G' => 2,
                  'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3, 'F' => 4, 'H' => 4,
                  'V' => 4, 'W' => 4, 'Y' => 4, 'K' => 5, 'J' => 8, 'X' => 8,
                  'Q' => 10, 'Z' => 10 }.freeze

  def initialize(string)
    @string = string
  end

  def valid_input?
    @string =~ /^[a-z]+$/i
  end

  def score
    return 0 unless valid_input?
    @string.upcase.chars.map { |char| POINT_VALUE[char] }.reduce(&:+)
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
