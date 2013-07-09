File.open(ARGV[0]).each_line do |line|
  puts line.split(",").map(&:strip).uniq.join(",")
end