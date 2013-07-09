File.open(ARGV[0]).each_line do |line|
  depth = line.to_i
  result = "1 "
  arr = []
  prev = [1]
  for d in 2..depth
    for k in 0...d
      n = ((k-1) < 0 ? 0 : prev[k-1]) +( prev[k].nil? ? 0 : prev[k])
      arr[k] = n
      result += n.to_s + " "
    end
    prev = arr
    arr = []
  end
  puts result.strip
end