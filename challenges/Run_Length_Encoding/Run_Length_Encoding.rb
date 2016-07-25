class RunLengthEncoding

    
  def self.encode(input)
    output_arr = []
    input_arr = input.split('')
    counter = 1
    current_char = input_arr[0]
    1.upto(input.length) do |index|
      if input_arr[index] == current_char
        counter += 1
      else
        if counter == 1
          output_arr << current_char
        else  
          output_arr << counter.to_s << current_char
        end
        current_char = input_arr[index]
        counter = 1
      end
    end
    output_arr.join("")
  end

  def self.decode(input)
    output = []
    input_arr = input.split('')
    decode_arr = input.scan(/(\d+)(\D)|(\D)/).flatten.compact
    decode_arr.map! do |a|
      if a.match(/\d+/)
        a.to_i
      else
        a = a 
      end
    end
    counter = 1
    decode_arr.each do |e|
      if e.class == Fixnum
        counter = e 
      else
        counter.times do 
          output << e 
        end
        counter = 1 
      end
    end
    output.join("")
  end
end
