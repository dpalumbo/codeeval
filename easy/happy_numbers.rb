File.open(ARGV[0]).each_line do |line|
  n = line.strip
  history = {}
  happy = true
  while n != "1"
    if history[n]
      puts "0"
      happy = false
      break
    else 
      history[n] = true
    end
    n = n.split(//).map(&:to_i).map{|x| x**2}.inject(&:+).to_s
  end
  puts "1" if happy
end