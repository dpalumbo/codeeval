def longest_repeated_substring(str)
  len = str.length
  subs = []
  for i in 0...len
    subs.push(str[i...len])
  end
  subs.sort!
  result = ""
  for i in 0...(len - 1)
    a_index = len - subs[i].length
    b_index = len - subs[i + 1].length
    max_distance = (a_index - b_index).abs
    a = subs[i][0...max_distance]
    b = subs[i + 1][0...max_distance]
    temp = longest_common_prefix(a, b)
    result = temp if temp.length > result.length
  end
  if result.strip == ""
    return "NONE"
  else
    return result
  end
end

def longest_common_prefix(a, b)
  n = [a.length, b.length].min
  for i in 0...n
    return a[0...i] if a[i] != b[i]
  end
  return a[0...n]
end

File.open(ARGV[0]).each_line do |line|
  puts longest_repeated_substring(line.strip)
end