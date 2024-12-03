input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

safe_report_count = 0

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

input.split("\n").each do |line|
  new_line = line.split(" ").map(&:to_i)
  
  increasing = new_line.each_cons(2).all? { |a, b| (b - a).between?(1, 3) }
  decreasing = new_line.each_cons(2).all? { |a, b| (a - b).between?(1, 3) }
  
  safe = increasing || decreasing || safe_with_dampener?(new_line)
  safe_report_count += 1 if safe
end

puts safe_report_count