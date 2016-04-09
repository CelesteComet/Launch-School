class SumOfMultiples
  def initialize(*set); @set = *set; end; 
  def self.to(num); SumOfMultiples.new(3,5).to(num); end; 
  def to(num); (1...num).select { |multiple| @set.any? { |law| multiple % law == 0 } }.inject(0, :+); end; 
end
  
