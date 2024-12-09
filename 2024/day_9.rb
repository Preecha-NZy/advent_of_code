@disk_map =  $stdin.readlines.map(&:chomp).map { _1.split("") }.flatten.map(&:to_i)

def amphipod(disk)
  disk_size = disk.size
  # puts "disk size: #{disk_size} before: #{disk}"
  index = 0
  while index < disk_size
    if disk[index] == "."
      num = disk.pop

      while num == "."
        num = disk.pop
      end
      
      disk[index] = num
    end

    index += 1
  end

  # puts "disk size: #{disk.size} after: #{disk}"
  disk
end

def eager_amphipod(disk)
  disk.each_with_index do |nums, index|
    next if nums.include?(".")

    (disk.size-1).downto(index+1) do |i|
      if disk[i].include?(".") && disk[i].size >= nums.size
        # puts "i: #{i} disk[i]: #{disk[i]}"
        # puts "nums size: #{nums.size}"
        # puts "disk[i].size: #{disk[i].size}"
        # puts "#{disk[i].shift(nums.size)}"
        # puts "disk[i]: #{disk[i]}"
        # puts "add: #{disk.insert(i+1, nums)}"
        # puts "delete: #{disk[index] = ["."] * nums.size}"
        # puts "after delete: #{disk.flatten.reverse.join}"
        
        disk[i].shift(nums.size)
        disk.insert(i+1, nums)
        disk[index] = ["."] * nums.size
        break
      end
    end
  end
  
  disk.flatten.reverse
end

def part_1
  id = 0
  disk = []
  result = 0

  @disk_map.each_with_index do |num, index|
    if index % 2 == 0 
      disk << [id.to_s] * num
      id += 1
    else
      disk << ["."] * num
    end
  end

  amphipod_disk = amphipod(disk.flatten)

  amphipod_disk.each_with_index do |num, index|
    result += num.to_i * index
  end

  pp result
end

def part_2
  id = 0
  disk = []
  result = 0

  @disk_map.each_with_index do |num, index|
    if index % 2 == 0 
      disk << [id.to_s] * num
      id += 1
    else
      disk << ["."] * num
    end
  end

  disk.reject!(&:empty?).reverse!
  eager_amphipod_disk = eager_amphipod(disk)

  eager_amphipod_disk.each_with_index do |num, index|
    next if num == "."
    # puts "num: #{num} index: #{index}"
    result += num.to_i * index
  end

  pp result
end


part_1
part_2





