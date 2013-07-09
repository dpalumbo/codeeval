def double_squares_count(n)
  x = Math.sqrt(n/2).to_i.floor
  total = 0
  for i in 0..x
    y = Math.sqrt(n - (i * i))
    if y == y.floor
      total += 1 
    end
  end
  return total
end

start = false
File.open(ARGV[0]).each_line do |line|
  puts double_squares_count(line.to_i) if start
  start = true
end