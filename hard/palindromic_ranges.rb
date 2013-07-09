def palindrome_count(range)
  left_sum = 0
  right_sum = 0
  if range.length > 1
    left = range[0..range.length-2]
    right = range[1..range.length-1]
    left_sum = palindrome_count(left) unless @@hash[left.to_s]
    @@hash[left.to_s] = true
    right_sum = palindrome_count(right) unless  @@hash[right.to_s]
    @@hash[right.to_s] = true
  end
  return (range.map{|x| x==x.reverse ? 1 : 0}.inject(:+) & 1 == 0 ? 1 : 0) + left_sum + right_sum
end
File.open(ARGV[0]).each_line{|line| @@hash = {}; puts palindrome_count((line.split[0].to_i..line.split[1].to_i).to_a.map(&:to_s))}