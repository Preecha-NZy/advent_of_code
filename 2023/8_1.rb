inputs = "RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ))".split("\n")

navigate = inputs[0]
network = inputs.reject(&:empty?)
                .map { |n| n.scan(/(\w{3})\s=\s\((\w{3}),\s(\w{3})\)/) }
                .reject(&:empty?)
                .flatten(1)
                .map { |n| [n[0], [n[1], n[2]]] }
                .to_h

selected_destination = "AAA"
step_count = 0

while selected_destination != "ZZZ"
  navigate.each_char do |direction|
    step_count += 1
    selected_destination = network[selected_destination][direction == "L" ? 0 : 1]
    break if selected_destination == "ZZZ"
  end
end

puts step_count