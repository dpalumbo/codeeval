File.open(ARGV[0]).each_line do |line|
  puts line.split.map{|x| x[0] = x[0].capitalize; x}.join(" ")
end