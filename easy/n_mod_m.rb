File.open(ARGV[0]).each_line do |line|
  n, m = line.split(",").map(&:to_f)
  puts ((n / m).to_s.match(/\.\d+/).to_s.to_f * m).to_i
end