def compute(operator,a,b)
  if operator == "*"
    return (a.to_i * b.to_i).to_s
  elsif operator == "/"
    return (a.to_i / b.to_i).to_s
  else operator == "+"
    return (a.to_i + b.to_i).to_s
  end
end

def is_number?(object)
  true if Float(object) rescue false
end

File.open(ARGV[0]).each_line do |line|
  elements = line.split
  while elements.length > 1
    for i in 0..(elements.length-1)
      if !is_number?(elements[i]) && is_number?(elements[i+1]) && is_number?(elements[i+2])
        elements[i..i+2] = compute(elements[i],elements[i+1],elements[i+2])
      end
    end
  end
  puts elements.first
end