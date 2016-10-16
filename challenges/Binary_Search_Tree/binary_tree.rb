class Node
  attr_accessor :data, :left, :right
  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def add(num)
    if (@left && @right) && (num > @data)
      @right.add(num)
    elsif (@left && @right) && (num <= @data)
      @left.add(num)
    else
      if num <= data
        @left = Node.new(num)
      else
        @right = Node.new(num)
      end
    end
  end
end



