File.open(ARGV[0]).each_line do |line|
  hash = {}
  line.split(//).each{|a| hash[a].nil? ? hash[a]=1 : hash[a]+=1}
  hash.each{|key,value| (puts key; break) if value==1}
end