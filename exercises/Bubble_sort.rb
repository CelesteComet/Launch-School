def bubble_sort(arr)
  ending = 1
  loop do 
    swapped = false


    0.upto(arr.length - ending) do |i|
      break if i == arr.length - 1
      next if arr[i] < arr[i+1]
      arr[i], arr[i+1] = arr[i+1], arr[i]
      swapped = true
    end


    break unless swapped
    ending += 1
  end
  arr

end

array = [6, 2, 7, 1, 4]
print bubble_sort(array)
