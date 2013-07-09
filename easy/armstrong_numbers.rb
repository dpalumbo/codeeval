File.open(ARGV[0]).each_line do |line|
  nums = line.strip.split(//)
  if line.to_i == nums.map(&:to_i).map{|x| x**nums.length}.inject(&:+)
    puts "True"
  else
    puts "False"
  end
end