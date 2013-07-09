File.open(ARGV[0]).each_line do |line|
  arr = line.split(";")
  puts (arr[0].split(",") & arr[1].split(",")).join(",")
end