File.open(ARGV[0]).each_line do |line|
  line = line.strip.split
  for i in 0...line.length
    idx = line[(i+1)..-1].index(line[i])
    if idx
      idx += i + 1
      tst = line[i...idx]
      if tst == line[idx...(idx + tst.length)]
        puts tst.join(" ")
        break
      end
    end
  end
end