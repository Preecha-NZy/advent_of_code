inputs = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11".split("\n")

# [1, 1, 1, 1, 1, 1]
# [1, 2, 2, 2, 2, 1] ==> 1
# [1, 2, 3, 3, 2, 1] ==> 2 original
# [1, 2, 4, 4, 2, 1] ==> 2 copy
# [1, 2, 4, 5, 3, 1] ==> 3
# [1, 2, 4, 6, 4, 1] ==> 3 copy
# [1, 2, 4, 7, 5, 1] ==> 3 copy
# [1, 2, 4, 8, 6, 1] ==> 3 copy
# [1, 2, 4, 8, 7, 1] ==> 4
# [1, 2, 4, 8, 8, 1] ==> 4 copy
# [1, 2, 4, 8, 9, 1] ==> 4 copy
# [1, 2, 4, 8, 10, 1] ==> 4 copy
# [1, 2, 4, 8, 11, 1] ==> 4 copy
# [1, 2, 4, 8, 12, 1] ==> 4 copy
# [1, 2, 4, 8, 13, 1] ==> 4 copy
# [1, 2, 4, 8, 14, 1] ==> 4 copy


ans = 0
winning_point = []
card_copies = []

inputs.each.with_index do |line, index|
  point= 0
  card_copies[index] = 1
  card, numbers = line.split(":")
  winning_number, your_number = numbers.split("|")
  winning_number = winning_number.split(" ").map(&:to_i)
  your_number.split(" ").map(&:to_i).each do |number|
    if winning_number.include?(number)
      point+= 1
    end
  end

  winning_point[index] = point
end

# puts winning_point
# puts "-----------------"
# puts card_copies
# puts "-----------------"

winning_point.each_with_index do |point, index|
  if index == 0
    point.times do |i|
      card_copies[index+i+1] +=1
    end
  else
    card_copies[index].times do |copy|
      point.times do |i|
        card_copies[index+i+1] +=1
      end
    end
  end
end

ans = card_copies.sum
puts ans

