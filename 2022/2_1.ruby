@choise = {
  "A" => "Rock",
  "B" => "Paper",
  "C" => "Scissors",
  "X" => "Rock",
  "Y" => "Paper",
  "Z" => "Scissors"
}

@outcomes = {
  "Rock": "Scissors",
  "Paper": "Rock",
  "Scissors": "Paper"
}

@style_score = {
  "Rock" => 1,
  "Paper" => 2,
  "Scissors" => 3
}

@result_score = {
  "Win" => 6,
  "Draw" => 3,
  "Lose" => 0
}

def get_match_score(first_player_choosed, second_player_choosed)
  first_choice = @choise[first_player_choosed]
  second_choice = @choise[second_player_choosed]

  if first_choice == second_choice
    return @result_score["Draw"] + @style_score[second_choice]
  elsif @outcomes.key(first_choice).to_s == second_choice
    return @result_score["Win"] + @style_score[second_choice]
  else
    return @result_score["Lose"] + @style_score[second_choice]
  end
end

result = "A Y
B X
C Z"

matchs = result.split("\n")
@total_score = 0
matchs.each do |match|
  @total_score += get_match_score(match[0], match[2])
  puts @total_score
end

puts @total_score


