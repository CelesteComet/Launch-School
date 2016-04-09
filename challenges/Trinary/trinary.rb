class Trinary
  def initialize(string_number)
    @answer = string_number.match(/\D/) ? 0 : string_number.split("").each.map {|n| n.to_i }.reverse.each_with_index.map {|num, index| num * 3**(index)}.inject(:+)
  end

  def to_decimal
    @answer
  end
end