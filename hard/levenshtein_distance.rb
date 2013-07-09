class Levenshtein
  def initialize(dict)
    @dict = dict
  end

  def get_distance(word)
    @used = {}
    queue = [word]
    @used[word] = true
    while queue.length > 0
      word = queue.shift
      for i in 0...word.length 
        temp = String.new(word)
        temp[i] = ""
        try_queue(temp,queue)
      end
      for x in "a".."z"
        for i in 0...word.length 
          temp = String.new(word)
          temp[i] = x
          try_queue(temp,queue)
        end
        for i in 0..word.length 
          temp = String.new(word)
          temp.insert(i,x)
          try_queue(temp,queue)
        end
      end
    end
    return @used.count - 1
  end

  def try_queue(word,queue)
    if @dict[word] && !@used[word]
      @used[word] = true
      queue.push(word)
    end
  end
end

dict = {}
File.open(ARGV[0]).each_line do |line|
  dict[line.chomp] = true  
end
puts Levenshtein.new(dict).get_distance("hello")