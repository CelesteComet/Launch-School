class Series
  attr_accessor :array_of_nums, :n
  def initialize(string, n)
    if n > string.length
      raise ArgumentError
    end
    @n = n 
    array_of_nums = string.split("").map! {|n| n.to_i}
    @array_of_nums = array_of_nums
    @answer = [] 
    # [1,2,3]
    array_of_nums.each_with_index do |num, i|
      set = []
      set << num 
      (n-1).times do
        # if next one exists and next one is previous one plus one, add next one to set
        if array_of_nums[i+1] && array_of_nums[i+1] == array_of_nums[i] + 1
          set << array_of_nums[i+1]
          i += 1
        end
      end
      @answer << set 
    end
  end

  def answer 
    @answer.select {|arrays| arrays.count == @n}
  end

end