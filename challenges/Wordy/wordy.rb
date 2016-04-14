class WordProblem

  OPERATORS = "plus|divided|minus|multiplied"
  QUESTIONS = "What|is|Can|you|give|me|the|answer|of"

  def initialize(question)
    if !question.match(/[#{QUESTIONS}] [-+]*\d+ [(#{OPERATORS}) by ([-+\d+]\d+)]+\?/) 
      raise ArgumentError
    end
    @array = question.gsub(/(#{QUESTIONS}|by|\?)/,"").split(" ")
  end

  def answer
    if @array.length == 1 
      return @array[0]
    end
    num1 = @array.shift.to_i
    operator = @array.shift
    num2 = @array.shift.to_i
    case operator
    when 'plus'
      @array.unshift(num1 + num2)
    when 'minus'
      @array.unshift(num1 - num2)
    when 'multiplied'
      @array.unshift(num1 * num2)
    when 'divided'
      @array.unshift(num1 / num2)
    end
    answer
  end
end