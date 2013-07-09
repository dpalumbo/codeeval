File.open(ARGV[0]).each_line do |line|
  puts line.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i) ? "true" : "false"
end