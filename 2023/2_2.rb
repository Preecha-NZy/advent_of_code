games = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green".split("\n")

def fewest_number_of_cubes(game)
  color_count = { "red" => 0, "green" => 0, "blue" => 0 }
  game_number, rounds = game.split(":")
  rounds.split(";").each do |round|
    round.split(",").each do |color|
      color_name = color.match(/\w{3,5}$/).to_s
      color_value = color.match(/[\d]+/).to_s.to_i
      if color_count[color_name] < color_value
        color_count[color_name] = color_value
      end
    end
  end
  return color_count.values
end

result = 0
possible_games = games.map.with_index do |game, i|
  result += fewest_number_of_cubes(game).inject(:*)
end.compact

puts result

