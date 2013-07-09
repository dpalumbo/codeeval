File.open(ARGV[0]).each_line do |line|
  arr = line.split(",").map(&:to_i)
  x = arr[0]
  n = arr[1]
  while n < x
    n *= 2
  end
  puts n  
end