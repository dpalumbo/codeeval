File.open(ARGV[0]).each_line do |line|
  x1, y1, x2, y2 = line.gsub(/\(|\)|,/,"").strip.split.map(&:to_i)
  puts Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2).to_i
end