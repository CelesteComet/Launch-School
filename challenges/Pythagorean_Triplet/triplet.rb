class Triplet
  attr_accessor :a, :b, :c 
  def initialize(a,b,c)
    @a, @b, @c = a, b, c
  end

  def pythagorean?
    (a**2 + b**2) == c**2 
  end

  def sum
    a + b + c
  end

  def product
    a * b * c 
  end

  def self.where(max_factor: nil, min_factor: 0, sum:nil)
    pythagorean_trips = []
    array = (min_factor..max_factor).to_a
    all_possible_triplets = array.combination(3).to_a
    all_possible_triplets.each do |triplet|
      if Triplet.new(triplet[0],triplet[1],triplet[2]).pythagorean? 
        if sum != nil
          if Triplet.new(triplet[0],triplet[1],triplet[2]).sum == sum
            pythagorean_trips << Triplet.new(triplet[0],triplet[1],triplet[2])
          end
        else
          pythagorean_trips << Triplet.new(triplet[0],triplet[1],triplet[2])
        end
      end
    end
    pythagorean_trips
  end
end

