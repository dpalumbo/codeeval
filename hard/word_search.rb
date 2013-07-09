class WordSearch
  def initialize(board)
    @board = board
  end

  def has_word(word)
    for i in 0...@board.length
      for j in 0...@board.first.length
        return true if move([i,j],word,{})
      end
    end
    return false
  end

  def move(pos,word,visited)
    return false if visited[pos]
    visited[pos] = true
    found = false
    if @board[pos[0]] && @board[pos[0]][pos[1]] && @board[pos[0]][pos[1]] == word[0]
      word = word[1..-1]
      if word.length == 0
        return true 
      else
        new_pos = [[pos[0] + 1,pos[1]],[pos[0] - 1,pos[1]],[pos[0],pos[1] + 1],[pos[0],pos[1] - 1]]
        new_pos.each do |p|
          found = move(p,word,visited.clone) if !found
        end
      end
    end
    return found
  end
end

File.open(ARGV[0]).each_line do |line|
  puts WordSearch.new(["ABCE","SFCS","ADEE"]).has_word(line.strip) ? "True" : "False"
end