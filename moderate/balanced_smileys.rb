def check_line(line)
  min = 0
  max = 0
  i = 0
  while i < line.length
    if line[i] == "("
      min += 1
      max += 1
    elsif line[i] == ":" && line[i+1] == "("
      max += 1
      i += 1
    elsif line[i] == ")"
      max -= 1
      min -= 1 if min > 0
      return false if max < 0
    elsif line[i] == ":" && line[i+1] == ")"
      min -= 1 if min > 0
      i += 1
    end 
    i += 1
  end
  return max >= 0 && min <= 0
end

File.open(ARGV[0]).each_line do |line|
  puts check_line(line) ? "YES" : "NO"
end