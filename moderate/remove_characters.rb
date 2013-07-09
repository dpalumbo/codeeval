File.open(ARGV[0]).each_line do |line|
  sentence = line.split(",")[0].strip
  to_remove = line.split(",")[1].strip
  to_remove.split(//).each{|x| sentence.gsub!(x,"")}
  puts sentence.strip
end