for i in 1..12
  line = ""
  for j in 1..12
    line += " " * (4 - (j * i).to_s.length) + "#{j * i}"
  end
  puts line.strip
end