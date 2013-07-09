File.open(ARGV[0]).each_line do |line|
  n, m = line.strip.split(",").map(&:to_i)
  ppl = (0...n).to_a
  order = []
  i = -1
  while order.length < n
    k = 0
    while k < m
      i += 1
      i = 0 if i >= n
        while ppl[i].nil?
          i += 1
          i = 0 if i >= n
        end
      k += 1
    end
    order.push(ppl[i])
    ppl[i] = nil
  end
  puts order.join(" ")
end