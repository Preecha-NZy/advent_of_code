inputs = "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483".split("\n")

CARD_MAP = {
  "T" => 10,
  "J" => 1,
  "Q" => 12,
  "K" => 13,
  "A" => 14
}

def is_digit(char)
	char.match(/\d/) ? true : false
end

def type_of_hand(hand)
  count = hand.chars.map do |card|
    hand.count(card)
  end

  if count.include?(5)
    return 6
  elsif count.include?(4)
    #if hvae j then return 6
    return 6 if hand.include?("J")
    return 5
  elsif count.include?(3) && count.include?(2)
    #if hvae j then return 6
    return 6 if hand.include?("J")
    return 4
  elsif count.include?(3)
    #if have j then return 5
    return 5 if hand.include?("J")
    return 3
  elsif count.count(2) == 4
    #if have 2 j then return 5
    #if have 1 j then return 4
    return 5 if hand.count("J") == 2
    return 4 if hand.count("J") == 1
    return 2
  elsif count.include?(2)
    #if have j then return 3
    return 3 if hand.include?("J")
    return 1
  else
    #if have j then return 1
    return 1 if hand.include?("J")
    return 0
  end
end

hands, points = inputs.map { |line| line.split }.transpose
points.map!(&:to_i)

card_type_point = []

hand_with_type = hands.map do |cards|
  [type_of_hand(cards), cards, points[hands.index(cards)]]
end

sorted_hand = hand_with_type.sort_by do |type, hand|
  a = hand.chars.map do |card|
    is_digit(card) ? card.to_i : CARD_MAP[card]
  end
  [type, a]
end

# puts sorted_hand.inspect

total_point = sorted_hand.each_with_index.map do |hand, index|
  hand[2].to_i * (index + 1)
end.reduce(:+)

puts total_point
