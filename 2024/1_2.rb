input = "
3   4
4   3
2   5
1   3
3   9
3   3".split("\n")

left = []
right = []
distance = []
similar_value = {}


input.each do |line|
  new_data = line.split(" ").map(&:to_i)
  left << new_data[0]
  right << new_data[1]
end

left.each do |v|
  if similar_value[v]
    distance << similar_value[v]
  else
    similar_count = right.select{ |n| n == v }.count
    similar_value[v] = similar_count * v
    distance << similar_value[v]
  end
end

puts distance.sum