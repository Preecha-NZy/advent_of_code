
@map =  $stdin.readlines.map(&:chomp).map { _1.split("") }

# pp @map
@max_y = @map.size - 1
@max_x = @map[0].size - 1

puts "max_y: #{@max_y} max_x: #{@max_x}"

def find_guard_position
  @map.each_with_index do |y, y_index|
    y.each_with_index do |x, x_index|
      if x == "^"
        return [y_index, x_index]
      end
    end
  end
end

def guard_in_map?(guard_position)
  guard_position[0] < @max_y && guard_position[1] < @max_x && guard_position[0] > 0 && guard_position[1] > 0
end

def part_1
  count = 0
  guard_routes = []
  guard_position = find_guard_position
  guard_direction = "up"

  while guard_in_map?(guard_position)
    # puts "guard_position: #{guard_position} guard_direction: #{guard_direction} guard_routes: #{guard_routes}"
    case guard_direction
    when "up"
      if @map[guard_position[0] - 1][guard_position[1]] == "#"
        guard_direction = "right"
      else
        count +=1
        guard_position[0] -= 1
        guard_routes << [guard_position[0], guard_position[1]]
      end
    when "right"
      if @map[guard_position[0]][guard_position[1] + 1] == "#"
        guard_direction = "down"
      else
        count +=1
        guard_position[1] += 1
        guard_routes << [guard_position[0], guard_position[1]]
      end
    when "down"
      if @map[guard_position[0] + 1][guard_position[1]] == "#"
        guard_direction = "left"
      else
        count +=1
        guard_position[0] += 1
        guard_routes << [guard_position[0], guard_position[1]]
      end
    when "left"
      if @map[guard_position[0]][guard_position[1] - 1] == "#"
        guard_direction = "up"
      else
        count +=1
        guard_position[1] -= 1
        guard_routes << [guard_position[0], guard_position[1]]
      end
    else
      break
    end
  end

  [guard_routes.uniq.size, count]
end

def part_2
  solution = 0

  (0..@max_y).each do |y|
    (0..@max_x).each do |x|
      next if @map[y][x] == "^"
      count = 0
      guard_routes = []
      guard_position = find_guard_position
      guard_direction = "up"
      new_map = @map.map(&:dup)
      new_map[y][x] = "O"

      if y == 7 && x == 8
        pp new_map
      end
      
      while guard_in_map?(guard_position)
        if count > @max_number_of_steps * 2
          puts "count: #{count} max_number_of_steps: #{@max_number_of_steps}"
          puts "y: #{y} x: #{x}"
          solution += 1
          break
        end

        case guard_direction
        when "up"
          if new_map[guard_position[0] - 1][guard_position[1]] == "#" || new_map[guard_position[0] - 1][guard_position[1]] == "O"
            guard_direction = "right"
          else
            count +=1
            guard_position[0] -= 1
            guard_routes << [guard_position[0], guard_position[1]]
          end
        when "right"
          if new_map[guard_position[0]][guard_position[1] + 1] == "#" || new_map[guard_position[0]][guard_position[1] + 1] == "O"
            guard_direction = "down"
          else
            count +=1
            guard_position[1] += 1
            guard_routes << [guard_position[0], guard_position[1]]
          end
        when "down"
          if new_map[guard_position[0] + 1][guard_position[1]] == "#" || new_map[guard_position[0] + 1][guard_position[1]] == "O"
            guard_direction = "left"
          else
            count +=1
            guard_position[0] += 1
            guard_routes << [guard_position[0], guard_position[1]]
          end
        when "left"
          if new_map[guard_position[0]][guard_position[1] - 1] == "#" || new_map[guard_position[0]][guard_position[1] - 1] == "O"
            guard_direction = "up"
          else
            count +=1
            guard_position[1] -= 1
            guard_routes << [guard_position[0], guard_position[1]]
          end
        else
          break
        end
      end
    end
  end
  solution
end

p part_1
@max_number_of_steps = part_1[1]

p part_2




