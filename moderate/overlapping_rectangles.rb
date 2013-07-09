File.open(ARGV[0]).each_line do |line|
  arr = line.split(",").map(&:to_i)
  if arr[0] > arr[6]
    puts "False"
  elsif arr[2] < arr[4]
    puts "False"  
  elsif arr[1] < arr[7]
    puts "False"  
  elsif arr[3] > arr[5]
    puts "False"  
  else
    puts "True"
  end    
end