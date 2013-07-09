File.open(ARGV[0]).each_line do |line|
  alphabet = {}
  ("a".."z").each{|x| alphabet[x] = true}
  line.split(//).each{|x| alphabet.delete(x.downcase)}
  str = ""
  alphabet.each{|key,value| str+=key}
  puts str=="" ? "NULL" : str
end