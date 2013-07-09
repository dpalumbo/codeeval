def permute(alphabet,arr,str,len)
  alphabet.each do |a|
    string = str + a
    if string.length >= len
      arr.push(string)
    else
      permute(alphabet,arr,string,len)
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  arr = line.split(",")
  len = arr[0].to_i
  alphabet = arr[1].strip.split(//).uniq
  result = []
  permute(alphabet,result,"",len)
  puts result.sort.join(",")
end