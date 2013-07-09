def possibilities(str)
  return 1 if str.nil? || str == "" || str.length == 1
  if str[0] == "1" || (str[0] == "2" && str[1].match(/[0-6]/))
    return possibilities(str[2..-1]) if str[1] == "0"
    return possibilities(str[1..-1]) + possibilities(str[2..-1])
  end
  return possibilities(str[1..-1])
end

File.open(ARGV[0]).each_line do |line|
  puts possibilities(line.strip)
end