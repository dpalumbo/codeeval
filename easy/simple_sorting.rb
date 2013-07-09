File.open(ARGV[0]).each_line do |line|
  puts line.split.sort_by{|x| x.to_f}.join(" ")
end