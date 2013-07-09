def valid_array(n,arr)
  for i in 1..n
    return false unless arr.include?(i)
  end
  return true
end

def check_sudoku(n,arr)
  squares = []
  for i in 0...n
    row = []
    column = []
    square = []
    for j in 0...n
      row.push(arr[n*i+j])
      column.push(arr[n*j+i])
      if n==9
          if j > 5
            s = j + 12
          elsif j > 2
            s = j + 6
          else
            s = j
          end
          if i > 5
            s = s + (i-6)*3 + 54
          elsif i > 2
            s = s + (i-3)*3 + 27
          else
            s = s + i*3
          end      
      else
          if j > 1
            s = j + 2
          else
            s = j
          end
          if i > 1
            s = s + (i-2)*2 + 8
          else
            s = s + i*2
          end    
      end
      square.push(arr[s])
    end
    return false unless valid_array(n,row) && valid_array(n,column) && valid_array(n,square)
  end
  return true
end

File.open(ARGV[0]).each_line do |line|
  arr = line.strip.split(";")
  if check_sudoku(arr[0].to_i,arr[1].split(",").map(&:to_i))
    puts "True"
  else
    puts "False"
  end  
end