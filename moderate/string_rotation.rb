def is_rotation(w1,w2)
  return false if w1.length != w2.length
  return true if (w1 + w1)[w2]
  return false
end

File.open(ARGV[0]).each_line do |line|
  w1, w2 = line.strip.split(",")
  puts is_rotation(w1,w2) ? "True" : "False"
end