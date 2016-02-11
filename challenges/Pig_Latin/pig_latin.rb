class PigLatin
  def self.translate(string)
    string.split(' ').map {|word| translate_word(word)}.join(' ')
  end
  def self.translate_word(word)
    if self.begins_with_vowel_sound?(word)
      word + 'ay'
    else 
      match = word.match(/\A([^aeiou]*qu)([aeiou]\w+)|([^aeiou]+)(\w+)/)
      consonant_sound = match.captures.select{|n| n != nil}[0]
      the_rest_of_word= match.captures.select{|n| n != nil}[1]
      the_rest_of_word + consonant_sound + 'ay'
    end
  end
  def self.begins_with_vowel_sound?(word)
    word.match(/\A[aeiou]|[xy][^aeiou]/)
  end
end



