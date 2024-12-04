file = File.read("2024/puzzle/day_3.txt")

input_1 = file.scan(/mul\(\d+,\d+\)/)
input_2 = file.scan(/(do\(\)|don't\(\)|mul\(\d+,\d+\))/).flatten


def part1(input)
  result = 0
  input.each do |match|
    numbers = match.scan(/\d+/).map(&:to_i)
    result += numbers.reduce(:*)
  end

  result
end

def part2(input)
  result = 0
  enabled = true
  input.each do |match|
    if match == "do()"
      enabled = true
    elsif match == "don't()"
      enabled = false
    elsif match.start_with?("mul") && enabled
      numbers = match.scan(/\d+/).map(&:to_i)
      result += numbers.reduce(:*)
    end
  end

  result
end

puts part1(input_1)
puts part2(input_2)