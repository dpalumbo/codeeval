def balanced_parentheses(str)
  stack = []
  char_list = { ")" => "(", "}" => "{", "]" => "[" }
  chars = str.split(//)
  for i in 0...chars.length
    if char_list[chars[i]]
      return false unless stack.pop == char_list[chars[i]]
    else
      stack.push(chars[i])
    end
  end
  return false if stack.length > 0
  return true
end

File.open(ARGV[0]).each_line do |line|
  puts balanced_parentheses(line.strip) ? "True" : "False"
end