File.open(ARGV[0]).each_line do |line|
  chars = line.gsub(/\W/,"").downcase.split(//)
  occurences = {}
  chars.each do |c|
    occurences[c] = occurences[c] ? occurences[c] + 1 : 1
  end
  vals = []
  occurences.each{|k,v| vals.push(v)}
  vals.sort_by!{|x| -x}
  nums = []
  for i in 0...vals.length
    nums.push(vals[i] * (26 - i))
  end
  puts nums.inject(&:+)
end