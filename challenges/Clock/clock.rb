class Clock
  def initialize(minutes)
    @total_minutes = minutes % 1440
    @hours = @total_minutes / 60
    @minutes = @total_minutes % 60
  end

  def self.at(hours, minutes = 0) 
    Clock.new(hours * 60 + minutes)
  end

  def +(minutes)
    Clock.new(@total_minutes += minutes)
  end

  def -(minutes)
    Clock.new(@total_minutes -= minutes)
  end

  def to_s
    stringify(@hours) + ":" + stringify(@minutes)
  end

  def ==(anotherClockObj)
    if anotherClockObj.class == "Clock"
      self.to_s == anotherClockObj.to_s ? true :  false
    else
      false
    end
  end

  def class
    "Clock"
  end

  private

  def stringify(numericTime)
    numericTime < 10 ? "0" + numericTime.to_s : numericTime.to_s
  end
end

