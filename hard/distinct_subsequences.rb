#brute force
def distinct_subsequences(str,sub)
  all = str.split(//).combination(sub.length)
  total = 0
  all.each{|a| total += 1 if a.join == sub }
  return total
end

File.open(ARGV[0]).each_line do |line|
  str, sub = line.strip.split(",")
  puts distinct_subsequences(str,sub)
end