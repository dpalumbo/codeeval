File.open(ARGV[0]).each_line do |line|
  puts line.split[-2]
end