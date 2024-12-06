file = $stdin.read
@input =  file.split("\n").map(&:chars)
@rows = @input.size
@cols = @input[0].size

def forward(row, col)
  if col + 3 < @cols
    return "#{@input[row][col]}#{@input[row][col + 1]}#{@input[row][col + 2]}#{@input[row][col + 3]}"
  end
end

def backward(row, col)
  if col - 3 >= 0
    return "#{@input[row][col]}#{@input[row][col - 1]}#{@input[row][col - 2]}#{@input[row][col - 3]}"
  end
end

def downward(row, col)
  if row + 3 < @rows
    return "#{@input[row][col]}#{@input[row + 1][col]}#{@input[row + 2][col]}#{@input[row + 3][col]}"
  end
end

def downward_left(row, col)
  if row + 3 < @rows && col - 3 >= 0
    return "#{@input[row][col]}#{@input[row + 1][col - 1]}#{@input[row + 2][col - 2]}#{@input[row + 3][col - 3]}"
  end
end

def downward_right(row, col)
  if row + 3 < @rows && col + 3 < @cols
    return "#{@input[row][col]}#{@input[row + 1][col + 1]}#{@input[row + 2][col + 2]}#{@input[row + 3][col + 3]}"
  end
end

def upward(row, col)
  if row - 3 >= 0
    return "#{@input[row][col]}#{@input[row - 1][col]}#{@input[row - 2][col]}#{@input[row - 3][col]}"
  end
end

def upward_left(row, col)
  if row - 3 >= 0 && col - 3 >= 0
    return "#{@input[row][col]}#{@input[row - 1][col - 1]}#{@input[row - 2][col - 2]}#{@input[row - 3][col - 3]}"
  end
end

def upward_right(row, col)
  if row - 3 >= 0 && col + 3 < @cols
    return "#{@input[row][col]}#{@input[row - 1][col + 1]}#{@input[row - 2][col + 2]}#{@input[row - 3][col + 3]}"
  end
end

def mas_downward_left(row, col)
  if row + 2 < @rows && col - 2 >= 0 && col < @cols
    return "#{@input[row][col]}#{@input[row + 1][col - 1]}#{@input[row + 2][col - 2]}"
  end
end

def mas_downward_right(row, col)
  if row + 2 < @rows && col + 2 < @cols
    return "#{@input[row][col]}#{@input[row + 1][col + 1]}#{@input[row + 2][col + 2]}"
  end
end

def mas_upward_left(row, col)
  if row - 2 >= 0 && col - 2 >= 0 && row < @rows && col < @cols
    return "#{@input[row][col]}#{@input[row - 1][col - 1]}#{@input[row - 2][col - 2]}"
  end
end

def mas_upward_right(row, col)
  if row - 2 >= 0 && col + 2 < @cols && row < @rows
    return "#{@input[row][col]}#{@input[row - 1][col + 1]}#{@input[row - 2][col + 2]}"
  end
end

def part1
  result = 0

  @input.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      result += [
        forward(row_i, col_i), 
        backward(row_i, col_i), 
        downward(row_i, col_i), 
        downward_left(row_i, col_i), 
        downward_right(row_i, col_i), 
        upward(row_i, col_i), 
        upward_left(row_i, col_i), 
        upward_right(row_i, col_i)
      ].count { |x| x == "XMAS" }
    end
  end

  result
end

def part2
  result = 0

  @input.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      count =  [
        mas_downward_right(row_i, col_i),
        mas_downward_left(row_i, col_i + 2),
        mas_upward_right(row_i + 2, col_i),
        mas_upward_left(row_i + 2, col_i + 2)
      ].count { |x| x == "MAS" }

      result += 1 if count == 2
    end
  end

  result
end

p part1
p part2






