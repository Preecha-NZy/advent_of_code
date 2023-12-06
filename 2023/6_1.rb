inputs = "Time:      7  15   30
Distance:  9  40  200".split("\n")

times = inputs[0].split(":")[1].split.map(&:to_i)
distances = inputs[1].split(":")[1].split.map(&:to_i)

winning_probability = []
times.each.with_index do |t, i|
  winning_time = 0
  t.times do |j|
    if (t - j) * j > distances[i]
      # puts "t: #{t}, j: #{j}, t-j: #{t-j}, (t-j)*j: #{(t-j)*j}, distances[i]: #{distances[i]}"
      winning_time +=1
    end
  end

  winning_probability << winning_time
  # puts "\n"
end

p winning_probability.inject(:*)
