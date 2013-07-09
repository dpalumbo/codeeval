class RoboGrid
  def initialize(grid_size, finish)
    @grid_size = grid_size
    @finish = finish
  end

  def ways_to_end(position, visited)
    visited[[position[0], position[1]]] = true
    return 1 if position == @finish
    up,down,left,right = 0,0,0,0    
    down = ways_to_end([position[0], position[1] + 1], visited.clone) if position[1] + 1 < @grid_size && !visited[[position[0], position[1] + 1]]
    up = ways_to_end([position[0], position[1] - 1], visited.clone) if position[1] - 1 >= 0 && !visited[[position[0], position[1] - 1]]
    left = ways_to_end([position[0] - 1, position[1]], visited.clone) if position[0] - 1 >= 0 && !visited[[position[0] - 1, position[1]]]
    right = ways_to_end([position[0] + 1, position[1]], visited.clone) if position[0] + 1 < @grid_size && !visited[[position[0] + 1, position[1]]]
    return up + down + left + right
  end
end

puts RoboGrid.new(4,[3,3]).ways_to_end([0,0],{})