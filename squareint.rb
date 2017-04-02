arr = [4, 0.2, 10, -1, -25, 25]

def squareInt(arr)
  arrcopy = []
  arr.each do |x|
    arrcopy.push(x ** 2) if x > 0
  end
  arrcopy
end

puts squareInt(arr)
puts "---"
puts arr
