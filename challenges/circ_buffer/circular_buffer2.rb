class CircularBuffer
  def initialize(length)
    length.times do
      num = 0 
      instance_variable_set("@a#{num}".to_sym, nil)
      num += 1
    end
  end
end