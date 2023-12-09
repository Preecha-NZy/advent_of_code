inputs = "0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45".split("\n")

ans = 0

inputs.each do |line|
  continue = true
  prev_line = line.split(" ").map(&:to_i)
  last_value = []
  # puts "prev_line: #{prev_line.inspect}"
  loop do
    next_line = prev_line.each_cons(2).map { |a, b| b - a }
    last_value << prev_line.last
    prev_line = next_line
    # puts "next_line: #{next_line.inspect}, prev_line: #{prev_line.inspect}, last_value: #{last_value.inspect}"

    if next_line.all? { |n| n == 0 }
      ans += last_value.reduce(:+)
      break
    end
    # puts "\n"
  end
end
puts ans

