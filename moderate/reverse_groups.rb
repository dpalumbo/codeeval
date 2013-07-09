File.open(ARGV[0]).each_line do |line|
  list, n = line.strip.split(";")
  list = list.split(",")
  n = n.to_i
  result = []
  temp = []
  i = 0
  for i in 0...list.length
    if i % n == 0
      result.push(temp.reverse).flatten!
      temp = []
    end
    temp.push(list[i])
  end
  temp.reverse! if list.length % n == 0
  result.push(temp).flatten!
  puts result.join(",").strip
end