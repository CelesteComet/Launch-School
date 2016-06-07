class Phrase

  def initialize(string)
    @string = string
  end

  def word_count

    counter = {}

    # returns an array of words as strings
    words = @string.scan(/(\w+'t|\w+)/).flatten

    words.each do |word|
      counter[word] = words.count(word)
    end
    
    counter
  end

end

print Phrase.new("First: don't laugh. Then: don't cry.").word_count