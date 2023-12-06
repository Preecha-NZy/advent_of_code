inputs = "Time:      7  15   30
Distance:  9  40  200".split("\n")

times = inputs[0].split(":")[1].split.map(&:to_i)
distances = inputs[1].split(":")[1].split.map(&:to_i)

time = times.inject{ |sum, n| sum.to_s + n.to_s }.to_i
distance = distances.inject{ |sum, n| sum.to_s + n.to_s }.to_i

puts "#{time} #{distance}"

start_winning = 0
time.times do |t|
  if (time - t) * t > distance
    start_winning = t
    break
  end
end

winning_probability = (time + 1) - start_winning * 2
puts winning_probability