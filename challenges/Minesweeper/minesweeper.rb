require 'pry'

class Board


  def self.transform(inp)
    # we want to start at the second string element
    # iterate through each array, exluding the first one
    # iterate through each of the cells excluding the first and last one
    # => if it is empty count around and the cell becomes the count
    arr = inp 
    arr.map! {|row| row.split("")}

    arr.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell == " " # if cell is a space
          number_of_mines = count_around(arr, row_index, cell_index)
          if number_of_mines == 0
            arr[row_index][cell_index] = ' '
          else
            arr[row_index][cell_index] = number_of_mines.to_s
          end
        end
      end
    end

    arr.map! {|row| row.join("")}
    
  end

  def self.count_around(arr, y, x)
    count = 0
    #left and right
    if arr[y][x+1] && arr[y][x+1] == '*'
      count += 1 
    end
    if arr[y][x-1] && arr[y][x-1] == '*'
      count += 1
    end
    #top and bottom
    if arr[y+1][x] && arr[y+1][x] == '*'
      count += 1
    end
    if arr[y-1][x] && arr[y-1][x] == '*'
      count += 1
    end
    #bot left bot right
    if arr[y-1][x-1] && arr[y-1][x-1] == "*"
      count += 1
    end
    if arr[y-1][x+1] && arr[y-1][x+1] == "*"
      count += 1
    end
    if arr[y+1][x+1] && arr[y+1][x+1] == "*"
      count += 1
    end
    if arr[y+1][x-1] && arr[y+1][x-1] == "*"
      count += 1
    end
    count
  end

 #inp =  ['+------+', 
  #      ['| *  * |',  #===> ['|', ' ', '*', ' ', ' ' '*', ' ', '|']
  #      ['|  *   |',  #===> ['|', ' ', ' ', '*',' ', ' ', ' ', '|']
  #      ['|    * |', 
  #      ['|   * *|', 
  #      ['| *  * |', 
  #      ['|      |', 
  #      ['+------+']
end

 inp = ['+------+', 
        '| *  * |', 
        '|  *   |', 
        '|    * |', 
        '|   * *|',
        '| *  * |', 
        '|      |', 
        '+------+']

puts Board.transform(inp)







