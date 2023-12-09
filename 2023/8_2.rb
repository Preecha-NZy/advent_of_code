inputs = "LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)".split("\n")

navigate = inputs.reject { |input| input.empty? }[0]

network = inputs.reject(&:empty?)
                .map { |n| n.scan(/(\w{3})\s=\s\((\w{3}),\s(\w{3})\)/) }
                .reject(&:empty?)
                .flatten(1)
                .map { |n| [n[0], [n[1], n[2]]] }
                .to_h

# puts network.inspect

selected_destination = network.each.map do |key, value|
  key if key.end_with?("A")
end.compact

destination_nodes_step_count = Array.new(selected_destination.length, 0)

selected_destination.each_with_index do |node, index|
  while !node.end_with?("Z")
    navigate.each_char do |direction|
      destination_nodes_step_count[index] += 1
      node = network[node][direction == "L" ? 0 : 1]
    end
  end
end

puts destination_nodes_step_count.inspect

# For some reason, this issue able to sovle by using find the lcm of the array
# https://www.reddit.com/r/adventofcode/comments/18dg1hw/2023_day_8_part_2_about_the_correctness_of_a/
# https://www.reddit.com/r/adventofcode/comments/18did3d/2023_day_8_part_1_my_input_maze_plotted_using/
def find_lcm(arr)
  arr.reduce(1) { |lcm, num| lcm.lcm(num) }
end

ans = find_lcm(destination_nodes_step_count)
puts ans


