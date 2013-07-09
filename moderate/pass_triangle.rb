class Triangle
  def initialize(data)
    @data = data
    @sums = {}
  end
  
  def max_sum(i,j)
    return 0 if @data[i].nil? || @data[i][j].nil?
    return @data[i][j] if @data[i+1].nil?
    @sums[[i + 1,j]] = max_sum(i+1,j) if @sums[[i + 1,j]].nil?
    @sums[[i + 1,j + 1]] = max_sum(i+1,j+1) if @sums[[i + 1,j+1]].nil?
    return @data[i][j] + [@sums[[i + 1,j]], @sums[[i + 1,j + 1]]].max    
  end
end

triangle = []
File.open(ARGV[0]).each_line do |line|
  triangle.push(line.strip.split.map(&:to_i))
end

puts Triangle.new(triangle).max_sum(0,0)