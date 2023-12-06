inputs = "Time:      7  15   30
Distance:  9  40  200".split("\n")

times = inputs[0].split(":")[1].split.map(&:to_i)
distances = inputs[1].split(":")[1].split.map(&:to_i)

winning_probability = times.map.with_index do |t, i|
  start_winning = (0...t).find { |j| (t - j) * j > distances[i] } || 0
  winning_time = (t + 1) - start_winning * 2
end

puts winning_probability.reduce(:*)
