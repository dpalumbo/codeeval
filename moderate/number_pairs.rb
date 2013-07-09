File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(";")
  total = arr[1].to_i
  nums = arr[0].strip.split(",").map(&:to_i)
  result = []
  nums.combination(2).to_a.each{|a| result.push(a) if a.first + a.last == total}
  puts result.length > 0 ? result.map{|a| a.join(",")}.join(";") : "NULL"
end