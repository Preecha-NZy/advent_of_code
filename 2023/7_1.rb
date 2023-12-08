inputs = "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483".split("\n")

CARD_MAP = {
  "T" => 10,
  "J" => 11,
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
    return 5
  elsif count.include?(3) && count.include?(2)
    return 4
  elsif count.include?(3)
    return 3
  elsif count.count(2) == 4
    return 2
  elsif count.include?(2)
    return 1
  else
    return 0
  end
end

hands, points = inputs.map { |line| line.split }.transpose
points.map!(&:to_i)

hand_with_type = hands.map do |cards|
  [type_of_hand(cards), cards, points[hands.index(cards)]]
end

sorted_hand = hand_with_type.sort_by do |type, hand, _|
  cards = hand.chars.map do |card|
    is_digit(card) ? card.to_i : CARD_MAP[card]
  end
  [type, cards]
end

# puts sorted_hand.inspect

total_point = sorted_hand.map.with_index(1) do |(_, _, point), index|
  point * index
end.sum

puts total_point
