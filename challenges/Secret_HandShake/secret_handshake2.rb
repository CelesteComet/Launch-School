class SecretHandshake

  reverse = Proc.new { |commands| commands.reverse }
    
  ACTIONS = ["wink", "double blink", "close your eyes", "jump", reverse]

  def initialize(num)
    @num = num 
    @commands = []
  end

  def commands
    return @commands if (@num.class != Fixnum)
    binary = @num.to_s(2)
    binary.reverse.split("").each_with_index do |value, index|
      @commands << ACTIONS[index] if value == "1"
      @commands = ACTIONS[index].call(@commands) if ACTIONS[index].class == Proc
    end
    @commands.select {|e| e.class == String}
  end
end








