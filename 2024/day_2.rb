file = File.read("2024/puzzle/day_2.txt")

input = file.split("\n").map { |line| line.split(" ").map(&:to_i) }

def safe_with_dampener?(levels)
  levels.each_with_index do |_, index|
    temp_levels = levels.dup
    temp_levels.delete_at(index)

    increasing = temp_levels.each_cons(2).all? { |a, b| (b - a).between?(1, 3) }
    decreasing = temp_levels.each_cons(2).all? { |a, b| (a - b).between?(1, 3) }

    return true if increasing || decreasing
  end
  false
end

def part1(input)
  result = 0

  input.each do |line|
    increasing = line.each_cons(2).all? { |a, b| (b - a).between?(1, 3) }
    decreasing = line.each_cons(2).all? { |a, b| (a - b).between?(1, 3) }
  
    safe = increasing || decreasing
  
    result += 1 if safe
  end

  result
end

def part2(input)
  result = 0

  input.each do |line|
    increasing = line.each_cons(2).all? { |a, b| (b - a).between?(1, 3) }
    decreasing = line.each_cons(2).all? { |a, b| (a - b).between?(1, 3) }
  
    safe = increasing || decreasing || safe_with_dampener?(line)
    result += 1 if safe
  end

  result
end


puts part1(input)
puts part2(input)