class Sieve
  attr_accessor :number

  def initialize(number)
    @number = number 
  end

  def primes 
    original_list = (2..number).to_a
    new_list = (2..number).to_a 
    original_list.each do |num|
      new_list.delete_if {|n| n != num && n % num == 0}
    end
    new_list
  end
end

