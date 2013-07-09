File.open(ARGV[0]).each_line do |line|
  center_x, center_y, radius, point_x, point_y = line.gsub(/[A-Za-z]|:|;|,|\(|\)/,"").strip.split.map(&:to_f)
  puts (point_x - center_x) ** 2 + (point_y - center_y) ** 2 <= radius ** 2
end