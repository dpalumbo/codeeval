def string_replace(str,subs,depth)
  return if str.length * subs.length == 0
  while !depth.to_s.match(/[2-9]/)
    depth += 1
  end
  placeholder = depth.to_s * subs[0].length
  str.gsub!(subs[0],placeholder)
  replacer = subs[1]
  subs = subs[2..-1]
  string_replace(str,subs,depth + 1)
  str.gsub!(placeholder,replacer)
  return str
end

File.open(ARGV[0]).each_line do |line|
  s, sub_s = line.strip.split(";")
  subs = sub_s.split(",")
  puts string_replace(s,subs,2)
end