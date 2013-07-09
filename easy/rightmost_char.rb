File.open(ARGV[0]).each_line do |line|
  arr = line.split(",")
  i = arr[0].index(arr[1].strip)
  if i.nil?
    puts "-1"
  else
    puts i
  end
end