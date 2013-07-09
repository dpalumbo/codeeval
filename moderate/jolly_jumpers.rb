File.open(ARGV[0]).each_line do |line|
  nums = line.split.map(&:to_i)
  nums.shift
  jollys = {}
  for i in 0..(nums.length - 2)
    jollys[((nums[i] - nums[i+1]).abs)] = true
  end
  jolly = true
  for i in 1..(nums.length - 1)
    jolly = false if !jollys[i]
  end
  if jolly
    puts "Jolly"
  else
    puts "Not jolly"
  end
end