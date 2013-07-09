File.open(ARGV[0]).each_line do |line|
  code, keys = line.split("|")
  code.strip!
  keys = keys.strip.split
  result = ""
  keys.each do |k|
    result += code[k.to_i-1]
  end
  puts result
end