file = File.read("2024/puzzle/day_1.txt")

input = file.split("\n").map { |line| line.split(" ").map(&:to_i) }

def part1(input)
  # transpose the input from [[x,y], [x,y]] to [[x,x], [y,y]]
  # then sort the inner arrays to get the smallest and largest values
  # then transpose again to get the original format

  input.transpose.map(&:sort).transpose.map { |line| (line[0] - line[1]).abs }.sum
end

def part2(input)
  # We can use tally to count the number of similar values in the array
  # input = [3, 3, 1, 2, 2, 3]
  # input.tally = {3=>3, 1=>1, 2=>2}

  similar_value = {}
  distance = 0
  left = input.transpose[0]
  right = input.transpose[1]

  left.each do |v|
    if similar_value[v]
      distance += similar_value[v]
    else
      similar_count = right.select{ |n| n == v }.count
      similar_value[v] = similar_count * v
      distance += similar_value[v]
    end
  end

  distance
end

puts part1(input)
puts part2(input)
