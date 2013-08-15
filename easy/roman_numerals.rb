Map = [[1, "I"], [5, "V"], [10, "X"], [50, "L"], [100, "C"], [500, "D"], [1000, "M"]]
def integer_to_roman(num)
  roman = ""
  i = 6
  while num > 0
    while num >= Map[i][0]
      num -= Map[i][0]
      roman += Map[i][1]
    end
    break if num == 0
    if num >= Map[i][0] - Map[i - 2][0]
      roman += Map[i - 2][1] + Map[i][1]
      num -= Map[i][0] - Map[i - 2][0]
    elsif num >= Map[i - 1][0]
      roman += Map[i - 1][1]
      num -= Map[i - 1][0]
    elsif num >= Map[i - 1][0] - Map[i - 2][0]
      roman += Map[i - 2][1] + Map[i - 1][1]
      num -= Map[i - 1][0] - Map[i - 2][0]
    end
    i -= 2
  end
  roman
end

File.open(ARGV[0]).each_line do |line|
  puts integer_to_roman(line.to_i)
end