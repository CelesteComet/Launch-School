require 'pry'
class Queens
  attr_reader :board
  def initialize(position = {white: [0,3], black: [7,3]})
    @position = position
  end

  def white
    @position[:white]
  end

  def black
    @position[:black]
  end

  def to_s
    cells = []
    8.times do 
      row = %w[_ _ _ _ _ _ _ _]
      cells << row 
    end
    cells 
    @position.keys.each do |color|
      if color == :white
        row = @position[:white][0]
        column = @position[:white][1]
        cells[row][column] = "W"
      elsif color == :black
        row = @position[:black][0]
        column = @position[:black][1]
        cells[row][column] = "B"
      end
    end
    cells
    string = ""
    table = cells 
    table.each do |row|
      row.each_with_index do |cell,idx|
        if idx == 7
          string += cell 
        else
          string += cell + " "
        end
      end
      string += "\n"
    end
    string.chomp.strip
  end

  def attack?
    if (white[0] == black[0]) || (white[1] == black[1]) || diagonals_of_position(white).include?(black)
      true
    else
      false
    end
  end

  def diagonals_of_position(position) # yes I could've used math and used abs but I am bad at math so this is what I first thought of.
    diagonals = [] # 4 diagonals
    # going top-left
    entry = position
    while entry[0] >= 0 && entry[1] >= 0
      entry = [entry[0] - 1, entry[1] + 1]
      diagonals << entry
    end
    #going top-right
    entry = position
    while entry[0] <= 7 && entry[1] >= 0
      entry = [entry[0] + 1, entry[1] + 1]
      diagonals << entry
    end
    #going bot-left
    entry = position
    while entry[0] >= 0 && entry[1] <= 7
      entry = [entry[0] - 1, entry[1] - 1]
      diagonals << entry
    end
    #going bot-right
    while entry[0] <= 7 && entry[1] <= 7
      entry = [entry[0] + 1, entry[1] - 1]
      diagonals << entry
    end
    diagonals
  end
end




