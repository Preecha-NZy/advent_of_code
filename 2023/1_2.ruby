words = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen".split("\n")

def find_digit(word)
	digits = []
	for i in 0..word.length-1
		if is_digit(word[i])
			digits.push(word[i])
		end
		digit_in_word = find_digit_in_word(word[i..])
		# puts digit_in_word
		if digit_in_word
			digits.push(digit_in_word)
		end
	end
	# puts word
	puts "digits: #{digits}"
	(digits.first.to_s + digits.last.to_s).to_i
end

def is_digit(char)
	char.match(/\d/) ? true : false
end

def find_digit_in_word(word)
	digit_in_word = nil
	digit_words = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
	digit_words.each_with_index do |digit_word, i|
		if word.match(/^#{digit_word}/)
			return digit_in_word = i+1
		end
	end

	return digit_in_word
end

count = 0
score = 0
words.each do |word|
	score += find_digit(word)
end

puts score