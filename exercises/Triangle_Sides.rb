def triangle(a,b,c)

  def valid?(a,b,c)
    sides = [a,b,c]
    max = sides.sort![-1]
    if (sides[0] + sides[1] < max) || sides.any? {|side| side <= 0}
      return false
    end
    true
  end

  if valid?(a,b,c)
    case 
    when (a == b && a == c)
      :equilateral
    when (a != b && a != c)
      :scalene
    else
      :isosceles
    end
  else
    :invalid
  end
end
