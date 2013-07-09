File.open(ARGV[0]).each_line do |line|
    max_temp = 0
    max_total = 0
    line.split(",").map(&:to_i).each do |d|
      max_temp = [0, max_temp + d].max
      max_total = [max_total, max_temp].max
    end
    puts max_total
end