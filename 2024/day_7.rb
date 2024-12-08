@equation = $stdin.readlines.map(&:chomp).map { _1.split(":") }.map { [_1, _2.split(" ")] }

# this function is not good at performance
def part_1_with_loop
  results = []

  @equation.each do |eq|
    operators = ["+", "*"]
    (0...2**(eq[1].size-1)).each do |i|
      expression = eq[1][0].to_s
      (1...eq[1].size).each do |j|
        operator = operators[(i >> (j-1)) & 1]
        expression += operator + eq[1][j].to_s
      end
      parts = expression.split(/(\D)/)
      result = parts.shift.to_i
      # puts "expression: #{expression} parts: #{parts} result: #{result}"
      until parts.empty?
        operator = parts.shift
        operand = parts.shift.to_i
        result = result.send(operator, operand)
      end
      if result == eq[0].to_i
        results << result
        break
      end
    end
  end

  results.uniq.sum
end


def equal?(current, nums, expected)
  return current == expected if nums.empty? 
  return false if current > expected

  next_nums = nums.shift.to_i

  [current + next_nums, current * next_nums].any? { |n| equal?(n, nums.dup, expected) }
end

def equal_with_concat(current, nums, expected)
  return current == expected if nums.empty? 
  return false if current > expected

  next_nums = nums.shift.to_i
  concat = (current.to_s + next_nums.to_s).to_i

  [current + next_nums, current * next_nums, concat].any? { |n| equal_with_concat(n, nums.dup, expected) }
end

def part_1_with_recursion
  results = []
  new_equation = @equation

  new_equation.each do |eq|
    results << eq[0].to_i if equal?(0, eq[1].dup, eq[0].to_i)
  end

  results.sum
end

def part_2
  results = []
  new_equation = @equation

  new_equation.each do |eq|
    results << eq[0].to_i if equal_with_concat(0, eq[1].dup, eq[0].to_i)
  end

  results.sum
end

p part_1_with_recursion
p part_2