
class BufferEmptyException < Exception
end

class BufferFullException < Exception
end

class CircularBuffer

  def initialize(length)
    @buffer = Array.new(length) 
    center = (@buffer.length/2).floor
    @reader = center
    @writer = center
  end

  def write!(value)
    if value == nil 
      return 
    end
    if @buffer[@writer] == nil
      self.write(value)
    else
      @reader += 1
      wrap_check(@reader)
      @buffer[@writer] = value
      @writer += 1
      wrap_check(@writer)
    end
  end

  def write(value)
    if value == nil 
      return 
    end
    if self.buffer_full?
      raise BufferFullException.new
    end
    @buffer[@writer] = value
    @writer += 1
    wrap_check(@writer)
  end

  def read
    if @buffer[@reader] == nil
      raise BufferEmptyException.new
    else
      value = @buffer[@reader].dup
      @buffer[@reader] = nil 
      @reader += 1
      wrap_check(@reader)
      value
    end
  end

  def clear
    @buffer = Array.new(@buffer.length)
    center = (@buffer.length/2).floor
    @reader = center
    @writer = center
  end

  def wrap_check(pointer)
    if pointer == @writer
      if @writer > @buffer.length - 1
        @writer = 0
      elsif @writer < 0
        @writer = @buffer.length - 1
      end
    elsif pointer == @reader
      if @reader > @buffer.length - 1
        @reader = 0
      elsif @reader < 0
        @reader = @buffer.length - 1
      end
    end
  end

  def buffer_full?
    @buffer.include?(nil) ? (return false) : (return true)
  end
end










