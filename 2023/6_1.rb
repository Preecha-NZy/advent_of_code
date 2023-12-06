inputs = "Time:      7  15   30
Distance:  9  40  200".split("\n")

times = inputs[0].split(":")[1].split.map(&:to_i)
distances = inputs[1].split(":")[1].split.map(&:to_i)

winning_probability = []
start_winning = 0
times.each.with_index do |t, i|
  winning_time = 0
  t.times do |j|
    if (t - j) * j > distances[i]
      start_winning = j
      break
    end
  end

  winning_time = (t + 1) - start_winning * 2
  winning_probability << winning_time

  puts "start_winning: #{start_winning}, t: #{t}, winning_time: #{winning_time}"
end

p winning_probability.inject(:*)
