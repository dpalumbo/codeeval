File.open(ARGV[0]).each_line do |line|
  if line.strip != ""
    arr = line.split(";")[1].strip.split(",").map(&:to_i)
    puts arr.inject(&:+) - ((arr.length - 1) * (arr.length - 2)) / 2
  end
end