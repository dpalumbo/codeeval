File.open(ARGV[0]).each_line do |line|
  arr = line.split(",").map(&:strip)
  if arr[0].split(//).last(arr[1].length).join==arr[1]
    puts "1" 
  else 
    puts "0"
  end
end