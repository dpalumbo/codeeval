got_n = false
sentences = []
n = 0
File.open(ARGV[0]).each_line do |line|
    if got_n
      sentences.push(line.strip)
    else
      n = line.to_i
      got_n = true 
    end
end
sentences.sort_by(&:length).reverse.take(n).each{|s| puts s}