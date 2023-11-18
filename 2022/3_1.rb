def find_the_duplicate_character(comparment)
  first_comparment = comparment[0..comparment.length/2-1]
  second_comparment = comparment[comparment.length/2..comparment.length]
  
  second_comparment.each_char do |char|
    if first_comparment.count(char) > 0
      return char
    end
  end
end

def get_the_character_point(character)
  point = character.ord - 96
  point.positive? ? point : point + 58
end

rucksacks = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw".split("\n")



point = 0
rucksacks.each do |rucksack|
  duplicate_character = find_the_duplicate_character(rucksack)
  point += get_the_character_point(duplicate_character)
end

puts point
