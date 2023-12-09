inputs = "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45".split("\n")

ans = 0
inputs.each do |line|
  prev_line = line.split(" ").reverse.map(&:to_i)
  last_value = []

  loop do
    next_line = prev_line.each_cons(2).map { |a, b| a - b }
    last_value << prev_line.last
    prev_line = next_line

    if next_line.all? { |n| n == 0 }
      puts "last_value: #{last_value.inspect}"
      ans += last_value.reverse.inject { |a, b| b - a}
      break
    end
  end
end
puts ans


# inputs = "1 3 6 10 15 21"
# ans = 0

# continue = true
# last_value = []

# prev_line = inputs.split(" ").reverse.map(&:to_i)
# next_line = prev_line.each_cons(2).map { |a, b| a - b }
# last_value << prev_line.last
# puts "next_line: #{next_line.inspect}, prev_line: #{prev_line.inspect}, last_value: #{last_value.inspect}"

# prev_line = next_line
# next_line = prev_line.each_cons(2).map { |a, b| a - b }
# last_value << prev_line.last
# puts "next_line: #{next_line.inspect}, prev_line: #{prev_line.inspect}, last_value: #{last_value.inspect}"

# prev_line = next_line
# next_line = prev_line.each_cons(2).map { |a, b| a - b }
# last_value << prev_line.last
# puts "next_line: #{next_line.inspect}, prev_line: #{prev_line.inspect}, last_value: #{last_value.inspect}"

# prev_line = next_line
# next_line = prev_line.each_cons(2).map { |a, b| a - b }
# last_value << prev_line.last
# puts "next_line: #{next_line.inspect}, prev_line: #{prev_line.inspect}, last_value: #{last_value.inspect}"

# last_value.reverse.each_with_index do |n, i|
#   puts "n: #{n}"
#   ans = n - ans
# end

# # # puts last_value.reverse.inspect
# # # ans += last_value.reduce(:-)
# puts ans

# 0,  1,  3,  6,  10,  15,  21
#   1    2,  3,  4,   5,   6
#     1,  1,  1,   1,   1
#       0,  0,  0,  0
    