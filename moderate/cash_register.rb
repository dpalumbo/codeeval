money = {
'PENNY' => 0.01,
'NICKEL' => 0.05,
'DIME' => 0.10,
'QUARTER' => 0.25,
'HALF DOLLAR' => 0.50,
'ONE' => 1.00,
'TWO' => 2.00,
'FIVE' => 5.00,
'TEN' => 10.00,
'TWENTY' => 20.00,
'FIFTY' => 50.00,
'ONE HUNDRED' => 100.00
}

File.open(ARGV[0]).each_line do |line|
  pp, ch = line.strip.split(";").map(&:to_f)
  if pp == ch
    puts "ZERO"
    next
  elsif pp > ch
    puts "ERROR"
    next
  end
  change = (ch - pp).round(2)
  change_array = []
  money.sort_by{|k,v| v}.reverse.each do |k,v|
    while change >= v
      change_array.push(k)
      change = (change - v).round(2)
    end
  end
  puts change_array.join(",")
end