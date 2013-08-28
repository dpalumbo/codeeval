File.open(ARGV[0]).each_line do |line|
  a, b, n = line.split.map(&:to_i)
  l = ""
  for i in 1..n
    str = ""
    str << "F" if i % a == 0
    str << "B" if i % b == 0
    str = i.to_s if str == ""
    l << str + " "
  end
  puts l.strip
end
