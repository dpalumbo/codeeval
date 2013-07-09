File.open(ARGV[0]).each_line do |line|
  i = 0
  while line != line.reverse
    i += 1
    line = (line.to_i + line.reverse.to_i).to_s
  end
  puts i.to_s + " " + line
end