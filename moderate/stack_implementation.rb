#not actually a stack implementation.
File.open(ARGV[0]).each_line do |line|
  line.split.reverse.each_with_index{|item,idx| print item + " " if idx & 1 == 0 }
  print "\n"
end