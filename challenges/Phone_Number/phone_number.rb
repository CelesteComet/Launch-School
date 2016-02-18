class PhoneNumber

  def initialize(string)
    # removes all nonsense.
    @string_numbers = string.gsub(/[\s).(-]/, "")
  end

  def number
    # returns string number format.
    is_valid ? @string_numbers[-10..-1] : "0000000000"
  end

  def area_code
    # returns 3 digit string for area code, if number is invalid return nil.
    is_valid ? @string_numbers[-10..-8] : nil
  end

  def to_s
    # returns formatted phone number string without country extension => "(408) 292-3211".
    is_valid ? "(#{self.area_code}) #{@string_numbers[-7..-1].insert(3,'-')}" : nil
  end

  private

  def is_valid
    # takes a string of numbers when cleared for nonsense and checks if numbers make up a valid phone number.
    @string_numbers.match(/(\A1?\d{10}\z)/) ? true : false
  end

end





