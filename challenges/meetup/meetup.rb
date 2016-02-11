require 'date'
require 'pry'

class Meetup

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    days = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]

    counter = 0
    (1..31).each do |i|
      if Date.new(@year, @month, i).wday == days.index(weekday)
        counter += 1
        if schedule == :teenth && i >= 13 && i < 20
          return Date.new(@year, @month, i)
        end
        if counter == 1 && schedule == :first
          return Date.new(@year, @month, i)
        end
        if counter == 2 && schedule == :second
          return Date.new(@year, @month, i)
        end
        if counter == 3 && schedule == :third
          return Date.new(@year, @month, i)
        end
        if counter == 4 && schedule == :fourth 
          return Date.new(@year, @month, i)
        end
        if counter == 4 && schedule == :last 
          if Date.valid_date?(@year, @month, i + 7)
            return Date.new(@year, @month, i+7)
          else
            return Date.new(@year, @month, i)
          end
        end
      end
    end
  end
end





