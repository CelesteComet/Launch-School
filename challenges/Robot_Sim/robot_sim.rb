class Robot
  attr_accessor :bearing, :coordinates

  def orient(direction)
    ![:east,:west,:north,:south].include?(direction) ? raise(ArgumentError) : @bearing = direction
  end

  def turn_right
    case @bearing
    when :north
      @bearing = :east
    when :south
      @bearing = :west 
    when :west
      @bearing = :north 
    when :east 
      @bearing = :south
    end
  end

  def turn_left
    case @bearing
    when :north
      @bearing = :west
    when :south
      @bearing = :east
    when :west
      @bearing = :south
    when :east 
      @bearing = :north
    end
  end

  def advance
    case bearing
    when :north 
      coordinates[1] += 1
    when :south
      coordinates[1] -= 1
    when :east 
      coordinates[0] += 1
    when :west
      coordinates[0] -= 1 
    end
  end

  def at(x, y)
    self.coordinates = [x, y]
  end
end

class Simulator
  def instructions(string)
    commands = []
    string.split("").each do |letter|
      case letter
      when 'L'
        commands << :turn_left
      when 'R'
        commands << :turn_right
      when 'A'
        commands << :advance
      end
    end
    commands
  end

  def place(robot, data)
    robot.coordinates = [data[:x], data[:y]]
    robot.bearing = data[:direction]
  end

  def evaluate(robot, string)
    commands = instructions(string)
    commands.each do |command|  
      robot.send(command)
    end
  end
end






