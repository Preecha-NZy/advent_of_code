inputs = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..".split("\n").map(&:strip)

def is_special_char?(char)
  !char.match(/[^\d.]/).to_s.empty?
end

def find_part_number_position(inputs, i, j)
  part_number_position = []
  for row in i-1..i+1
    for col in j-1..j+1
      if row >= 0 && col >= 0 && row < inputs.length && col < inputs[row].length && inputs[row][col].match(/\d/)
        while col >= 0 && inputs[row][col].match(/\d/)
          col -= 1
        end
        if !part_number_position.include?([row, col+1])
          part_number_position << [row, col+1]
        end
      end
    end
  end

  return part_number_position
end


def find_part_number(inputs, row, col)
  part_number = ""
  while col < inputs[row].length && inputs[row][col].match(/\d/)
    part_number += inputs[row][col]
    col += 1
  end
  return part_number
end


position = []
ans = 0
inputs.each_with_index do |row, i|
  row.chars.each_with_index do |char, j|
    if is_special_char?(char)
     position += find_part_number_position(inputs, i, j)
    end
  end
end

position.each do |row, col|
  ans += find_part_number(inputs, row, col).to_i
end
puts ans