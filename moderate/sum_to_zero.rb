File.open(ARGV[0]).each_line do |line|
  nums = line.strip.split(",").map(&:to_i)
  count = 0
  for i in 0...(nums.length - 3)
    for j in (i + 1)...(nums.length - 2)
      for k in (j + 1)...(nums.length - 1)
        for l in (k + 1)...nums.length
          count += 1 if (nums[i] + nums[j] + nums[k] + nums[l]) == 0
        end
      end
    end
  end
  puts count
end