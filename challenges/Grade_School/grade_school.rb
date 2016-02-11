class School
  def initialize
    @roster = {}
  end

  def to_h
    @roster.values.each {|students| students.sort!}
    @roster.sort.to_h
  end

  def add(name, grade)
    if !@roster[grade] then @roster[grade] = [] end
    @roster[grade] << name
  end

  def grade(num)
    !@roster[num] ? [] : @roster[num]
  end
end