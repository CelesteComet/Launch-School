def to_currency(string)
  dollarified = ""
  # returns dollars and cents in string format
  dollars = string.split(".")[0].to_s
  cents = string.split(".")[1]

  # .23
  if cents
    cents = ("." + cents).to_f.round(2).to_s.split(".")[1].ljust(2,"0")
    dollarified += ("." + cents)
  else
    dollarified += (".00")
  end

  # [1,4,5,4] => [4,5,4,1]
  dollars_array = dollars.split("").reverse

  counter = 0
  dollars_array.each_with_index do |num, i|
    counter += 1
    dollarified.prepend(num)
    if counter == 3
      if dollars_array[i+1]
        dollarified.prepend(",")
      end
      counter = 0
    end
  end
  "$" + dollarified
end

  


  






