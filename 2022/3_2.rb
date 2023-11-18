def find_the_duplicate_character(comparments)
  longest_comparment,index = comparments.each_with_index.max_by { |v,i| comparments[i].length }

  comparments.reject! { |comparment| comparment == longest_comparment }
  first_comparment = comparments[0]
  second_comparment = comparments[1]
  longest_comparment.each_char do |character|
    if first_comparment.count(character) > 0 && second_comparment.count(character) > 0
      return character
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

rucksacks_size = rucksacks.size / 3
point = 0

(1..rucksacks_size).each do |i|
  stop = 3 * i - 1
  start = stop - 2
  duplicate_character = find_the_duplicate_character(rucksacks[start..stop])
  point += get_the_character_point(duplicate_character)
end


puts point

