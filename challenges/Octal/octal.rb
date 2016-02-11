require 'pry'
class Octal
  attr_accessor :n 
  def initialize(n)
    @n = n 
  end

  def to_decimal
    if n.match(/(\D)|([89])/)
      return 0 
    end
    preprocessed_array_answer = []
    n.reverse.split('').each_with_index do |num,i|
      preprocessed_array_answer << num.to_i * (8**i)
    end
    preprocessed_array_answer.map! {|n| n.to_i}.inject(:+)
  end
end

n.reverse.split('').inject { |sum, number| sum + ( (number.to_i) * (8**number.index) ) }