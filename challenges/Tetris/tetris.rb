require 'pry'
require 'io/wait'
term = `stty -g`
`stty raw -echo cbreak`

class Cell
  def initialize
    @value = ' '
    @block_state = :empty
  end

  def self.value
    @value
  end

  def clear
    @value = ' '
  end

  def mark
    @value = '*'
  end

  def value
    @value
  end

  def block_state=(state)
    @block_state = state
  end

  def block_state
    @block_state
  end
end

class Grid

  attr_accessor :data

  def initialize(rows) # 4 5 is middle
    @data = []
    rows.times do 
      row = []
      10.times {row << Cell.new}
      @data << row 
    end
    @data
    @current_block_coordinates = "Bruce" 
    @number_of_rows = rows
  end

  def show
    show_array = []
    (0..(@number_of_rows - 1)).to_a.each do |row|
      row_array = []
      (0..9).to_a.each { |i| row_array << data[row][i].value }
      show_array << row_array
    end
    show_array.each do |row|
      print row 
      print "\n"
    end
  end 

  def clear_current_block
    @data.flatten.each do |cell|
      if cell.block_state == :current
        cell.clear
        cell.block_state = :empty
      end
    end
  end

  def block_down_one
    new_coordinates = []
    @current_block_coordinates.each do |coordinate|
      set = []
      set << coordinate[0] + 1 << coordinate[1]
      new_coordinates << set 
    end
    @current_block_coordinates = new_coordinates
  end

  def block_left_one
    new_coordinates = []
    @current_block_coordinates.each do |coordinate|
      set = []
      set << coordinate[0] << coordinate[1] - 1
      new_coordinates << set 
    end
    @current_block_coordinates = new_coordinates
  end

  def begin_block(arr_of_coordinates)
    @current_block_coordinates = arr_of_coordinates
    arr_of_coordinates.each do |coordinate|
      data[coordinate[0]][coordinate[1]].mark
      data[coordinate[0]][coordinate[1]].block_state = :current
    end
  end

  def mark_next
    @current_block_coordinates.each do |coordinate|
      data[coordinate[0]][coordinate[1]].mark
      data[coordinate[0]][coordinate[1]].block_state = :current
    end
  end

  def clear_down_there?
    new_coordinates = []
    @current_block_coordinates.each do |coordinate|
      set = []
      set << coordinate[0] + 1 << coordinate[1]
      new_coordinates << set 
    end
    new_coordinates.each do |coordinate|
      if outside_of_box?(coordinate) || colliding_with_another_box?(coordinate)
        return false
      elsif data[coordinate[0]][coordinate[1]].value != Cell.value && data[coordinate[0]][coordinate[1]].block_state != :current
        return false
      end
    end
    return true
  end

  def clear_there?(direction_key) # checks if coordinates of movement either is outside the box or collides with another box outside_of_box?(coordinate) || colliding_with_another_box?(coordinate)
    new_coordinates = []
    case direction_key
    when :down
      @current_block_coordinates.each do |coordinate|
        set = []
        set << coordinate[0] + 1 << coordinate[1]
        new_coordinates << set 
      end
      new_coordinates.each do |coordinate|
        if outside_of_box?(coordinate) || colliding_with_another_box?(coordinate)
          return false
        end
      end
    when :left
      @current_block_coordinates.each do |coordinate|
        set = []
        set << coordinate[0] << coordinate[1] - 1 
        new_coordinates << set 
      end
      new_coordinates.each do |coordinate|
        if outside_of_box?(coordinate) || colliding_with_another_box?(coordinate)
          return false
        end
      end
    end
    return true
  end

  def colliding_with_another_box?(coordinate)
    if data[coordinate[0]][coordinate[1]].block_state == :set 
      return true
    end
    return false
  end

  def outside_of_box?(coordinate)
    # data[ [] []  []   ]   here we have 3 rows  last row is 2 
    if coordinate[0] > data.count - 1 || coordinate[1] < 0 || coordinate[1] > 9
      return true
    end
    return false
  end

  def set_block
    @current_block_coordinates.each do |coordinate|
      data[coordinate[0]][coordinate[1]].block_state = :set
    end
  end

  def gameover?
    data[0].each do |cell|
      if cell.block_state == :set
        return true
      end
    end
    return false
  end

  def move_block(direction_key) # :down, :up, :left, :right
    case direction_key
    when :down
      if clear_there?(direction_key)
        clear_current_block
        block_down_one
        mark_next
      end
    when :left
      if clear_there?(direction_key)
        clear_current_block
        block_left_one
        mark_next
      end
    end
  end

  def at_lowest_spot?
    if clear_there?(:down)
      return false
    else
      return true
    end
  end

  def render
    system 'clear'
    self.show
  end


end






class Box
  def self.coordinates
    @coordinates = [[0,4],[0,5],[1,4],[1,5]]
  end
end

class LShape
  def self.coordinates
    @coordinates = [[0,4],[1,4],[2,4],[2,5]]
  end
end

class SShape
  def self.coordinates
    @coordinates = [[0,5],[0,6],[1,4],[1,5]]
  end
end

class IShape
  def self.coordinates
    @coordinates = [[0,4],[1,4],[2,4],[3,4]]
  end
end




grid = Grid.new(8)


grid.begin_block(Box.coordinates)
loop do
  if grid.gameover?
    break
  end
   
  if STDIN.ready?
    command = STDIN.getc
  end
  if command == 'a'
    #binding.pry
    grid.move_block(:left)
    grid.render
  end
  #binding.pry
  grid.render
  sleep 1
  grid.move_block(:down)


  if grid.at_lowest_spot?
   #grid.set_block
   #grid.render
   #sleep 1
   #grid.begin_block(Box.coordinates)
  end
end
