def single_digit_to_name(d)
  if d=="1"
    return "One"
  elsif d == "2"
    return "Two"
  elsif d == "3"
    return "Three"
  elsif d == "4"
    return "Four"
  elsif d == "5"
    return "Five"
  elsif d == "6"
    return "Six"
  elsif d == "7"
    return "Seven"
  elsif d == "8"
    return "Eight"
  elsif d == "9"
    return "Nine"
  else
    return ""
  end
end

def double_digit_to_name(d)
  num = d.to_i
  name = ""
  if num<10 || num>=20
    if d[0] == "2"
      name+="Twenty"
    elsif d[0] == "3"
      name+="Thirty"
    elsif d[0] == "4"  
      name+="Forty"
    elsif d[0] == "5"
      name+="Fifty"
    elsif d[0] == "6"
      name+="Sixty"
    elsif d[0] == "7"
      name+="Seventy"
    elsif d[0] == "8"
      name+="Eighty"
    elsif d[0] == "9"
      name+="Ninety"
    end
    return name+single_digit_to_name(d[1])
  else
    if d == "10"
      return name+"Ten"
    elsif d == "11"
      return name+"Eleven"
    elsif d == "12"
      return name+"Twelve"
    elsif d == "13"
      return name+"Thirteen"
    elsif d == "14"
      return name+"Fourteen"
    elsif d == "15"
      return name+"Fifteen"
    elsif d == "16"
      return name+"Sixteen"
    elsif d == "17"
      return name+"Seventeen"
    elsif d == "18"
      return name+"Eighteen"
    elsif d == "19"
      return name+"Nineteen"
    else
      return ""
    end
  end
end

File.open(ARGV[0]).each_line do |line|
  str = " "*9
  str_num = line.strip
  str[(9-str_num.length)..8] = str_num
  result = str_num=="0" ? "Zero" : ""
  0.upto(2).each do |i|
    num=str[i*3..(i*3+2)]
    hundred = num[0].to_i > 0 ? "Hundred" : ""
    result+=single_digit_to_name(num[0])+hundred+double_digit_to_name(num[1..2])
    if i==1 && num.to_i > 0
      result+="Thousand"
    elsif i==0 && num.to_i > 0
      result+="Million"
    end
  end
  puts result=="One" ? "#{result}Dollar" : "#{result}Dollars"
end