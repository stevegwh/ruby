def stock_picker(days)
  buy = 0
  sell = 0
  difference = 0
  arr = []

  days.each_with_index do |day_item, i|
    arr = days[i + 1...days.length]
    arr.each_with_index do |arr_item, j|
      if day_item < arr_item
        if arr_item - day_item > difference
          buy = i
          sell = days.index(arr_item)
          difference = arr_item - day_item
        end
      end
    end
  end
  puts [buy, sell]
end

stock_picker([17,3,6,9,15,8,6,1,10]);
