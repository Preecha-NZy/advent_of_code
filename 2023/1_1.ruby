words = "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet".split("\n")

def find_digit(word)
  digits = word.scan(/\d{1}/)
  (digits.first + digits.last).to_i
end


count = 0 

words.each do |word|
  count += find_digit(word)
end

puts count