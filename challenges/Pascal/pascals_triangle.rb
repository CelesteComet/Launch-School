class Triangle

  attr_reader :rows

  def initialize(steps)
    @rows = [[1]]
    @steps = steps
    @rows = create_row(@rows)
  end

  private 

  def create_row(previous_row)

    # stop recursion once function creates the necessary number of rows.
    if @steps == @rows.length
      return @rows
    end

    # length of new row will be 1 more than that of the previous row
    length_of_new_row = previous_row.length + 1

    first_index = 0
    last_index = length_of_new_row - 1

    new_row = []

    # first and last index will be 1, everything else will be a sum of the previous row index + the one before it. 
    length_of_new_row.times do |index|
      if index == first_index || index == last_index
        new_row[index] = 1
      else
        new_row[index] = previous_row[index] + previous_row[index-1]
      end
    end

    @rows << new_row

    create_row(new_row)

  end

end



