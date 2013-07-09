File.open(ARGV[0]).each_line do |line|
  arr = line.split
  num = arr.pop.to_i
  el = arr.reverse[num-1]
  puts el if !el.nil?
end