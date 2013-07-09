def get_dist(coord1,coord2)
  return Math.hypot(coord2[0]-coord1[0],coord2[1]-coord1[1])
end

@@coords_list = []

File.open(ARGV[0]).each_line do |line|
  coords = line.split.map(&:to_i)
  if coords[1].nil? && @@coords_list.length > 0
    min_val = @@coords_list.combination(2).to_a.map{|c| get_dist(c[0],c[1])}.min.round(4)
    puts(min_val >= 10000 ? "INFINITY" : min_val)
    @@coords_list = []
  elsif !coords[1].nil? 
    @@coords_list.push(coords) 
  end
end