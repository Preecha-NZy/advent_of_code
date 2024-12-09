@map = $stdin.readlines.map(&:chomp).map { _1.split("") }

@max_y = @map.size
@max_x = @map[0].size

def part_1
  nodes = {}
  antennas = []

  @map.each_with_index do |y, y_index| 
    y.each_with_index do |x, x_index|
      next if x == "."
      key = x

      nodes[key] ||= []
      nodes[key] << [y_index, x_index]
    end
  end

  nodes.each do |freq, positions|
    # puts "positions: #{positions}"
    positions.each do |current_positions|
      0.upto(positions.size - 1) do |i|
        next if current_positions == positions[i]
        dy = positions[i][0] - current_positions[0]
        dx = positions[i][1] - current_positions[1]
        
        dest_dy = current_positions[0] - dy
        dest_dx = current_positions[1] - dx
        
        # puts "current_positions: #{current_positions} positions[i]: #{positions[i]}"
        # puts "dest_dy: #{dest_dy} dest_dx: #{dest_dx}"
        # puts "max_y: #{@max_y} max_x: #{@max_x}"
        is_in_map = dest_dy >=0 && dest_dy < @max_y && dest_dx >= 0 && dest_dx < @max_x
        if is_in_map
          antennas << [dest_dy, dest_dx]
        end
      end
    end
  end

  nodes
  antennas.uniq.size
end


def part_2
  nodes = {}
  antennas = []

  @map.each_with_index do |y, y_index| 
    y.each_with_index do |x, x_index|
      next if x == "."
      key = x

      nodes[key] ||= []
      nodes[key] << [y_index, x_index]
    end
  end

  nodes.each do |freq, positions|
    # puts "positions: #{positions}"
    positions.each do |current_positions|
      0.upto(positions.size - 1) do |i|
        next if current_positions == positions[i]
        dy = positions[i][0] - current_positions[0]
        dx = positions[i][1] - current_positions[1]

        total_dy = dy
        total_dx = dx
        on_map = true

        while on_map
          dest_dy = current_positions[0] - total_dy
          dest_dx = current_positions[1] - total_dx
          is_in_map = dest_dy >=0 && dest_dy < @max_y && dest_dx >= 0 && dest_dx < @max_x
          if is_in_map
            antennas << [dest_dy, dest_dx]
            total_dy += dy
            total_dx += dx
          else
            on_map = false
          end
        end

        antennas << [current_positions[0], current_positions[1]]
      end
    end
  end

  nodes
  antennas.uniq.size
end

pp part_1
pp part_2



