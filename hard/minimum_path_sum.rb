class Matrix
  def initialize(data)
    @data = data
  end

  def min_path_sum
    @visited = {}
    move([0,0],@data[0][0])
    return @visited[[@data.length - 1, @data.length - 1]]
  end

  def move(pos,total)
    new_pos = [[pos[0],pos[1] + 1], [pos[0] + 1,pos[1]]]
    new_pos.each do |p|
      if @data[p[0]] && @data[p[0]][p[1]] && (!@visited[p] || (@data[p[0]][p[1]] + total) < @visited[p])
        @visited[p] = total + @data[p[0]][p[1]]
        move(p,@visited[p])
      end
    end
  end
end

arr = []

File.open(ARGV[0]).each_line do |line|
  row = line.strip.split(",")
  if row.length > 1
    arr.push(row.map(&:to_i))
    if arr.length == row.length
      puts Matrix.new(arr).min_path_sum 
      arr = []
    end
  end
end