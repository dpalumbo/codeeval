File.open(ARGV[0]).each_line do |line|
   n = line.split(",")[0].to_i
  m = line.split(",")[1].to_i
  arr = (2..m).to_a
  primes = []
  while arr.length > 0
    num = arr.shift
    primes.push(num)
    k = 1
    while k*num <= m
      arr.delete(k*num)
      k+=1
    end
  end
  puts primes.select{|x| x >= n && x<=m }.count
end