require 'pry'

class Board
  attr_accessor :data, :game_state

  def initialize
    @data = [
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ']
    ]
    @game_state = [
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def space_at(x,y)
    if x > 4 || y > 4
      return false
    else
      self.data[y][x]
    end
  end

  def g(x, y)
    if x > 4 || y > 4
      return false
    else
      self.game_state[y][x]
    end
  end

  def set_space(x, y, value)
    self.data[y][x] = value
  end

  # Returns 2 random integers coordinates
  def get_random_xy
    available_index = []
    self.data.each_with_index do |row, r_index|
      row.each_with_index do |cell, c_index|
        if cell == ' '
          available_index << [c_index, r_index]
        end
      end
    end
    x, y = available_index.sample
  end

  # Return 2 random integer coordinates that has a single adjacent
  def get_random_xy_single_adjacent
    available_index = []
    available_index_with_single_adjacent = []
    self.data.each_with_index do |row, r_index|
      row.each_with_index do |cell, c_index|
        if cell == ' '
          available_index << [c_index, r_index]
        end
      end
    end
    available_index.each do |set|
      if has_an_adjacent?(set[0], set[1])
        available_index_with_single_adjacent << set
      end
    end
    available_index_with_single_adjacent.sample
  end

  # Return 2 random integer coordinates that has a double adjacent
  def get_random_xy_double_adjacent
    available_index = []
    available_index_with_double_adjacent = []
    self.data.each_with_index do |row, r_index|
      row.each_with_index do |cell, c_index|
        if cell == ' '
          available_index << [c_index, r_index]
        end
      end
    end
    available_index.each do |set|
      if has_a_double_adjacent?(set[0], set[1])
        available_index_with_double_adjacent << set
      end
    end
    available_index_with_double_adjacent.sample
  end

  # Take an x y coordinate and returns an array of [x, y] coordinates that are adjacent
  def adjacent_to(x, y)
    set_of_xy = []
    # check right of x
    if space_at(x+1, y) && (x+1) >= 0 && space_at(x+1, y) == ' '
      set_of_xy << [x+1, y]
    end
    # check left x
    if space_at(x-1, y) && (x-1) >= 0 && space_at(x-1, y) == ' '
      set_of_xy << [x-1, y]
    end
    # check south y
    if space_at(x, y+1) && (y+1) <= 4 && space_at(x, y+1) == ' '
      set_of_xy << [x, y+1]
    end
    # check north y
    if space_at(x, y-1) && (y-1) >= 0 && space_at(x, y-1) == ' '
      set_of_xy << [x, y-1]
    end
    set_of_xy.each do |set|
      set.each do |element|
        if element < 0
          set_of_xy.delete(set)
        end
      end
    end
    set_of_xy
  end

  # Take an x y coordinate and returns an array of [x1, y1, x2, y2] coordinates that are double adjacent
  def double_adjacent_to(x, y)
    set_of_xy = []
    # check right of x
    if space_at(x+1, y) && space_at(x+2, y) && (x+1) >= 0 && space_at(x+1, y) == ' ' && space_at(x+2, y) == ' '
      set_of_xy << [x+1, y, x+2, y]
    end
    # check left x
    if space_at(x-1, y) && space_at(x-2, y) && (x-1) >= 0 && space_at(x-1, y) == ' ' && space_at(x-2, y) == ' '
      set_of_xy << [x-1, y, x-2, y]
    end
    # check south y
    if space_at(x, y+1) && space_at(x, y+2) && (y+1) <= 4 && space_at(x, y+1) == ' ' && space_at(x, y+2) == ' '
      set_of_xy << [x, y+1, x, y+2]
    end
    # check north y
    if space_at(x, y-1) && space_at(x, y-2) && (y-1) >= 0 && space_at(x, y-1) == ' ' && space_at(x, y-2) == ' '
      set_of_xy << [x, y-1, x, y-2]
    end
    set_of_xy.each do |set|
      set.each do |element|
        if element < 0
          set_of_xy.delete(set)
        end
      end
    end
    set_of_xy
  end

  def has_a_double_adjacent?(x, y)
    set = double_adjacent_to(x, y)
    if set.length >= 1
      return true
    else
      return false
    end
  end

  def has_an_adjacent?(x, y)

    set = adjacent_to(x, y)
    if set.length >= 1
      return true
    else
      return false
    end
  end

  def place_ship(ship_type)
    # choose a random space 
    # place a ship
    # d,c,b
    case ship_type
    when 'd'
      x, y = get_random_xy
      set_space(x, y, 'd')
    when 'c'
      x, y = get_random_xy_single_adjacent
      spaces = adjacent_to(x, y)
      second_x, second_y = spaces.sample
      set_space(x, y, 'c')
      set_space(second_x, second_y, 'c')
    when 'b'
      x, y = get_random_xy_double_adjacent
      spaces = double_adjacent_to(x, y)
      second_x, second_y, third_x, third_y = spaces.sample
      set_space(x, y, 'b') 
      set_space(second_x, second_y, 'b')
      set_space(third_x, third_y, 'b')
    end
  end

  def show
    print "+---+---+---+---+---+\n"
    print "| #{space_at(0,0)} | #{space_at(1,0)} | #{space_at(2,0)} | #{space_at(3,0)} | #{space_at(4,0)} |\n"
    print "+---+---+---+---+---+\n"
    print "| #{space_at(0,1)} | #{space_at(1,1)} | #{space_at(2,1)} | #{space_at(3,1)} | #{space_at(4,1)} |\n"
    print "+---+---+---+---+---+\n"
    print "| #{space_at(0,2)} | #{space_at(1,2)} | #{space_at(2,2)} | #{space_at(3,2)} | #{space_at(4,2)} |\n"
    print "+---+---+---+---+---+\n"
    print "| #{space_at(0,3)} | #{space_at(1,3)} | #{space_at(2,3)} | #{space_at(3,3)} | #{space_at(4,3)} |\n"
    print "+---+---+---+---+---+\n"
    print "| #{space_at(0,4)} | #{space_at(1,4)} | #{space_at(2,4)} | #{space_at(3,4)} | #{space_at(4,4)} |\n"
    print "+---+---+---+---+---+\n"
  end

  def showg
    print "   0   1   2   3   4  \n"
    print " +---+---+---+---+---+\n"
    5.times do |n|
      print "#{n}| #{g(0,n)} | #{g(1,n)} | #{g(2,n)} | #{g(3,n)} | #{g(4,n)} |\n"
      print " +---+---+---+---+---+\n"
    end
    print "Destroyer: #{ship_state('d')}     Cruiser: #{ship_state('c')}     Battleship: #{ship_state('b')}\n"
  end

  def mark(x, y)
    # HIT!
    if space_at(x, y) != ' '
      set_space(x, y, ' ')
      self.game_state[y][x] = 'X'
    else
      self.game_state[y][x] = '/'
    end
  end

  def ship_state(id)
    if self.data.flatten.include?(id)
      return "Alive"
    else
      return "Sunk!"
    end
  end

  def all_sunk?
    if ship_state('c') == "Sunk!" && ship_state('b') == "Sunk!" && ship_state('d') == "Sunk!"
      true
    else
      false
    end
  end
end

class Game
  attr_accessor :player, :computer
  def initialize
    @player = Player.new
    @computer = Player.new
  end

  def setup
    player.board.place_ship('b')
    player.board.place_ship('c')
    player.board.place_ship('d')
    computer.board.place_ship('b')
    computer.board.place_ship('c')
    computer.board.place_ship('d')
  end

  def renderg
    system 'clear'
    puts "Your Board"
    player.board.showg
    puts "\nBB-8's Board"
    computer.board.showg
  end

  def render
    system 'clear'
    player.board.show
    computer.board.show
  end

  def play
    self.setup
    self.renderg
    while !player.board.all_sunk? && !computer.board.all_sunk?
      player.human_choose(computer.board)
      self.renderg
      if computer.board.all_sunk?
        break
      end
      computer.computer_choose(player.board)
      self.renderg
    end
    self.renderg
    if player.board.all_sunk?
      puts "BB-8 Rolls You Down!"
    else
      puts "Move Ball! Player wins!"
    end
  end
end

class Player
  attr_accessor :board, :last_choice
  def initialize
    @board = Board.new
    @last_choice = nil
  end

  def human_choose(enemy_board)
    puts "Where? (ex. 00 for coordinates x = 0  and y = 0)"
    choice = gets.chomp
    x = choice[0].to_i
    y = choice[1].to_i
    enemy_board.mark(x, y)
  end

  def computer_choose(enemy_board)
    # computer AI
    # guess randomly
    # choices = get any square 
    # if hit and destroyer alive randomly guess the squares single adjacent
    # if hit and destroyer dead, continue to randomly guess the squares single adjacent
    # if hit and cruiser dead, get all double adjacent and randomly guess those
      # if hit
    def random_choice
      row_choices = []
      enemy_board.game_state.each_with_index do |row, r_index|
        if row.include?(' ')
          row_choices << r_index
        end
      end
      cell_choices = []
      row = row_choices.sample
      enemy_board.game_state[row].each_with_index do |cell, c_index|
        if cell == ' '
          cell_choices << c_index
        end
      end
      cell = cell_choices.sample
      enemy_board.mark(cell, row)
      last_choice = [cell, row]
      puts "Computer chooses (#{cell}, #{row})"
      sleep 2
    end

    def last_space
      space_at(last_choice[0], last_choice[1])
    end

    if last_choice == nil
      random_choice
    elsif last_choice && last_space == ' '
      random_choice
    elsif last_space != ' ' &&  enemy_board.ship_state('d') == "Alive"
      x, y = enemy_board.adjacent_to(last_choice[0], last_choice[1]).sample # returns x y
      enemy_board.mark(x, y)
    end
  end
end


Game.new.play








