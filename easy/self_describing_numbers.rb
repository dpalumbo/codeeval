File.open(ARGV[0]).each_line do |line|
  chars = line.strip.split(//).map(&:to_i)
  sd = true
  for i in 0...chars.length
    if chars.count(i) != chars[i]
      puts "0"
      sd = false
      break
    end
  end
  puts "1" if sd
end