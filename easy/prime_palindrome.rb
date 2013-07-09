def largest_prime_palindrome_below(n)
  #sieve method
  arr = (2..n).to_a
  i = 0
  while i < n
    while arr[i] == 0
      i += 1
    end
    if arr[i].nil?
      arr.select{|a| a > 0}.reverse.map(&:to_s).each do |a|
        return a if a == a.reverse
      end
    end
    k = 2
    while k * arr[i] <= n
      arr[(k * arr[i]) - 2] = 0
      k += 1
    end
    i += 1
  end
end

puts largest_prime_palindrome_below(1000)