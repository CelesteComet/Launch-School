class SecretHandshake
  def initialize(binary)
    @binary = binary
  end

  def get_binary_sequence
    if @binary.class == String
      return @binary.to_i
    end
    binary_sequence = []
    num = @binary
    while num != 0
      binary_sequence.unshift(num % 2)
      num = num / 2
    end
    binary_sequence.join("").to_i
  end

  def commands
    reverse = true
    commands = []
    sequence = get_binary_sequence
    if sequence > 10000
      reverse = false
      sequence -= 10000
    end
    if sequence > 1000 || sequence == 1000
      commands << "jump"
      sequence -= 1000
    end
    if sequence > 100 || sequence == 100
      commands << "close your eyes"
      sequence -= 100 
    end
    if sequence > 10 || sequence == 10 
      commands << "double blink"
      sequence -= 10
    end
    if sequence > 1 || sequence == 1
      commands << "wink"
      sequence -= 1
    end
    if reverse == true
      commands = commands.reverse
    end
    commands
  end
end
