File.open(ARGV[0]).each_line do |line|
  puts line.strip.chars.to_a.permutation.map(&:join).sort.uniq.join(",")
end