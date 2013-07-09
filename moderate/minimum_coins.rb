File.open(ARGV[0]).each_line do |line|
  num = line.to_i
  fives = (num / 5).floor 
  threes = ((num % 5) / 3).floor
  ones = num - 5 * (num / 5).floor - 3 * ((num % 5) / 3).floor
  puts fives + threes + ones
end