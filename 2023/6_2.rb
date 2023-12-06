inputs = "Time:      7  15   30
Distance:  9  40  200".split("\n")

times = inputs[0].split(":")[1].split.map(&:to_i)
distances = inputs[1].split(":")[1].split.map(&:to_i)

time = times.join.to_i
distance = distances.join.to_i

start_winning = (0...time).find { |t| (time - t) * t > distance } || 0
winning_probability = (time + 1) - start_winning * 2

puts winning_probability