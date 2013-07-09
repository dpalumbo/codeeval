File.open(ARGV[0]).each_line do |line|
  puts line.to_i & 1 == 1 ? "0" : "1"
end