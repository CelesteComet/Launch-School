# Atbash class that can invoke a class method called encode that takes in a string argument and encodes the string using Atbash algorithm
class Atbash
  cipher = {}
  counter = 1
  ('a'..'z').to_a.each do |letter|
    cipher[letter] = ('a'..'z').to_a[-counter]
    counter += 1
  end
  @cipher = cipher
  def self.encode(string)
    if string.class != String
      fail(ArgumentError, "Argument needs to be of type String.")
    else
      string.downcase.split("").delete_if { |n| n.match(/[^a-z0-9]/) }.map { |n| n.match(/[a-z]/) ? @cipher[n] : n }.join("").scan(/[a-z0-9]{1,5}/).join(" ")
    end
  end
end
