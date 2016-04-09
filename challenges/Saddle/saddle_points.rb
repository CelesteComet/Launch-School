class Matrix
  
  def initialize(string)
    @string = string
  end

  def rows 
    rows = []
    string_rows = @string.split("\n")
    string_rows.each do |string_row|
      rows << string_row.split(" ").map {|num| num.to_i}
    end
    rows
  end

  def columns 
    columns = []
    (0..rows[0].count - 1).to_a.each do |index|
      column = []
      rows.each do |row|
        column << row[index]
      end
      columns << column 
    end
    columns
  end

  def saddle_points
    points = []
    rows.each_with_index do |row, row_index|
      row.each_with_index do |num, column_index|
        if num >= row.sort[-1] 
          if num <= columns[column_index].sort[0]
            points << [row_index, column_index]
          end
        end
      end
    end
    points
  end
end



