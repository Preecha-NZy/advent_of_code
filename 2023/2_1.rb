games = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green".split("\n")

COLOR_MAX = {
  "red" => 12,
  "green" => 13,
  "blue" => 14,
}


def is_possible_game(game)
  game_number, rounds = game.split(":")
  possible = true
  rounds.split(";").each do |round|
    return unless possible
    round.split(",").each do |color|
      color_name = color.match(/\w{3,5}$/).to_s
      color_value = color.match(/[\d]+/).to_s.to_i
      if color_value > COLOR_MAX[color_name]
        possible = false
        break
      end
    end
  end
  return possible
end

possible_games = games.map.with_index do |game, i|
  i+1 if is_possible_game(game)
end.compact


puts possible_games.sum

