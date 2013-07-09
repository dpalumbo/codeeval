File.open(ARGV[0]).each_line do |line|
  word = line.split(",")[0].strip
  sub = line.split(",")[1].strip
  sub.gsub!(/\*/,".*")
  puts !((Regexp.new sub) =~ word).nil?
end