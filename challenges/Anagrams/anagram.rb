class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(words)
    words.select {|word| (is_anagram?(word)) && is_unique?(word)}
  end

  private

  def is_anagram?(word)
    word.downcase.chars.sort.join('') == @word.chars.sort.join('')
  end

  def is_unique?(word)
    word.downcase != @word
  end
end