def sum_primes(n)
  #sieve method
  #prime counting formula
  m = n * (Math.log(n)+1).ceil
  arr = (2..m).to_a
  i = 0
  while i < m
    while arr[i] == 0
      i += 1
    end
    return arr.select{|n| n > 0}.take(1000).inject(&:+) if arr[i].nil?
    k = 2
    while k * arr[i] <= m
      arr[(k * arr[i]) - 2] = 0
      k += 1
    end
    i += 1
  end
end

puts sum_primes(1000)