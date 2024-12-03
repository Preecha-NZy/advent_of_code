input = "3   4
4   3
2   5
1   3
3   9
3   3".split("\n")


left = []
right = []
distance = []


input.each do |line|
  new_data = line.split(" ").map(&:to_i)
  left << new_data[0]
  right << new_data[1]
end

left = left.sort
right = right.sort

left.each_with_index do |v, i|
  distance << (v - right[i]).abs
end


puts distance.sum
