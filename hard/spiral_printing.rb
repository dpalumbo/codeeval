def print_spiral(arr)
  result = ""
  i = 0
  x = 0
  y = 0
  height = arr.length
  width = arr.first.length
  delta_x = 1
  delta_y = 0
  visited = {}
  while i < height * width
    visited[[x,y]] = true
    result += arr[y][x] + " "
    if x + delta_x >= width || (delta_x > 0 && visited[[x + delta_x,y]])
      delta_x = 0
      delta_y = 1
    elsif x + delta_x < 0 || (delta_x < 0 && visited[[x + delta_x,y]])
      delta_x = 0
      delta_y = -1
    elsif y + delta_y >= height || (delta_y > 0 && visited[[x,y + delta_y]])
      delta_x = -1
      delta_y = 0
    elsif y + delta_y < 0 || (delta_y < 0 && visited[[x,y + delta_y]])
      delta_x = 1
      delta_y = 0
    end
    x += delta_x
    y += delta_y
    i += 1
  end
  return result.strip
end

File.open(ARGV[0]).each_line do |line|
  arr = []
  n, m, elements = line.strip.split(";")
  elements = elements.split
  for i in 0...n.to_i
    row = []
    for j in 0...m.to_i
      row.push(elements[i * m.to_i + j])
    end
    arr.push(row)
  end
  puts print_spiral(arr)
end