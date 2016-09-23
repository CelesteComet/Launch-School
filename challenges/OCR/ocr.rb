text = <<-NUMBER.chomp
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
NUMBER

class OCR

  NUMBERS = {
    "010101111" => "0",
    "000001001" => "1",
    "010011110" => "2",
    "010011011" => "3",
    "000111001" => "4",
    "010110011" => "5",
    "010110111" => "6",
    "010001001" => "7",
    "010111111" => "8",
    "010111011" => "9"
  }

	def initialize(text)
    @text = text
  end

  def get_binary_array
    array = @text.split("").delete_if { |e| e == "\n" }.map { |n| n != " " ? "1" : "0" }
  end

  def number_of_numbers
    get_binary_array.length / 9
  end

  def convert

    arrays = []

    number_of_numbers.times { arrays << [] }

    binary_array = get_binary_array

    loop do 
      arrays.each do |a|
        3.times { a << binary_array.shift }
      end
      break if binary_array.empty?
    end
    arrays.map! { |a| NUMBERS[a.join("")] }.join("")
  end

end

print OCR.new(text).convert














