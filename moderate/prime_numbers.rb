def primes_below(n)
  #sieve method
  arr = (2..n).to_a
  i = 0
  while i < n
    while arr[i] == 0
      i += 1
    end
    return arr.select{|x| x > 0} if arr[i].nil? 
    k = 2
    while k * arr[i] <= n
      arr[(k * arr[i]) - 2] = 0
      k += 1
    end
    i += 1
  end
end

File.open(ARGV[0]).each_line do |line|
  puts primes_below(line.to_i).join(",")
end