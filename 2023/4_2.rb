inputs = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11".split("\n")

ans = 0
winning_point = []
card_copies = []

inputs.each.with_index do |line, index|
  card_copies[index] = 1
  card, numbers = line.split(":")
  winning_number, your_number = numbers.split("|").map { |nums| nums.split.map(&:to_i) }
  point = your_number.count { |number| winning_number.include?(number) }

  winning_point[index] = point
end

winning_point.each_with_index do |point, index|
  card_copies[index].times{ 1.upto(point) { |i| card_copies[index + i] += 1} }
end

ans = card_copies.sum
puts ans

