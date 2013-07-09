File.open(ARGV[0]).each_line do |line|
  arr = line.split(",").map(&:to_i)
  n = arr[0]
  p1 = arr[1]
  p2 = arr[2]
  if (n >> (p1 - 1) & 1) == (n >> (p2 - 1) & 1)
    puts "true"
  else
    puts "false"
  end
end