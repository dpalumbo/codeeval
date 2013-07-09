class Matrix
  def initialize(data)
    @data = data
  end

  def set_row(i,x)
    for j in 0..255
      @data[i][j] = x
    end
  end

  def set_column(j,x)
    for i in 0..255
      @data[i][j] = x
    end
  end

  def query_row(i)
    puts @data[i].inject(&:+)
  end

  def query_column(j)
    total = 0
    for i in 0..255
      total += @data[i][j]
    end
    puts total
  end
end

matrix = Matrix.new(Array.new(256){Array.new(256,0)})

File.open(ARGV[0]).each_line do |line|
  func, i, x = line.strip.split  
  i = i.to_i
  x = x.to_i
  case func
    when "SetRow"
      matrix.set_row(i,x)
    when "SetCol"
      matrix.set_column(i,x)
    when "QueryRow"
      matrix.query_row(i)
    when "QueryCol"
      matrix.query_column(i)
  end
end