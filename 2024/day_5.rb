# _1 is mean the first element of the array
# we can use map { _1.split(",") } instead of map { |x| x.split(",") }
@rules, @update_list = $stdin.read.split("\n\n").map{ _1.split("\n") }

@update_list.map! { _1.split(",") }
@incorrect_update_list = []
@rules_hash = {}

@rules.each do |rule|
  if @rules_hash[rule.split("|")[0]]
    @rules_hash[rule.split("|")[0]] << rule.split("|")[1]
  else
    @rules_hash[rule.split("|")[0]] = [rule.split("|")[1]]
  end
end

def part1
  middle_page_number = []

  @update_list.each do |update|
    result = true
    # pp "update: #{update}"
    update.each_with_index do |page, index|
      current_page = page
      # pp "current_page: #{current_page} index: #{index} update: #{update.size}"
      # pp "@rules_hash: #{@rules_hash[current_page]}"
      if index < update.size - 1
        # pp "update[index+1]: #{update[index+1..update.size]}"
        result = update[index+1...update.size].all? do |page|
          if @rules_hash[current_page]
            @rules_hash[current_page].include?(page)
          else
            false
          end
        end
        # p "result: #{result}"
        # p "=================================="
        if result == false
          @incorrect_update_list << update
          break
        end
      end
    end

    if result
      middle_page_number << update[update.size/2]
    end
  end
  middle_page_number.sum(&:to_i)
end


def part2
  middle_page_number = []

  @incorrect_update_list.each do |update|
    # pp @rules_hash
    # pp update
    update.each_with_index do |page, index|
      next if index == 0
      # puts "outside"
      # pp page
      (index).downto(1) do |i|
        # puts "inside"
        current_page = update[i]
        if @rules_hash[current_page] && @rules_hash[current_page].include?(update[i-1])
          # puts i
          # puts "current_page: #{current_page} index: #{index}"
          # puts "before: #{update}"
          # puts "update[i-1]: #{update[i-1]}"
          update[i] = update[i-1]
          update[i-1] = current_page
          # puts "after: #{update}"
          # puts "\n"
        else
          break
        end
      end
    end
    middle_page_number << update[update.size/2]
  end
  # puts "final: #{@incorrect_update_list}"
  # puts "====================\n\n"
  middle_page_number.sum(&:to_i)
end


p part1
p part2