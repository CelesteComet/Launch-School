class Crypto

  def initialize(chars)
    @chars = chars
  end

  def normalize_plaintext
    normalized = @chars.gsub(/\W/, "").downcase
  end

  def size
    # if the number of chars is not a perfect square, find the next perfect square.
    if Math.sqrt(self.char_count) % 1 != 0
      Math.sqrt(self.char_count).ceil
    else
      Math.sqrt(self.char_count).to_i
    end
  end

  def plain_text_segments
    self.normalize_plaintext.scan(/.{1,#{self.size}}/)
  end

  def cipher_text

    text = ''

    # i is the index to gather each column
    self.size.times do |column|
      self.plain_text_segments.each do |row|
        if row[column]
          text += row[column]
        end
      end
    end
    text
  end

  def normalize_ciphertext
    normalized = self.cipher_text.gsub(/\W/, "").downcase
    normalized.scan(/.{1,#{4}}/).join(' ')
  end

  def char_count
    self.normalize_plaintext.length
  end




end

c = Crypto.new("Vampires are people too!")
print c.normalize_ciphertext




