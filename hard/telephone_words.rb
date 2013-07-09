class PhoneNumber
  def initialize(num)
    @number = num
    @map = {"0" => "0",
    "1" => "1",
    "2" => "abc",
    "3" => "def",
    "4" => "ghi",
    "5" => "jkl",
    "6" => "mno",
    "7" => "pqrs",
    "8" => "tuv",
    "9" => "wxyz"}
  end

  def possible_words
    @combos = []
    arr = @number.split(//)
    build_words(arr,"")
    return @combos.sort.join(",")
  end

  def build_words(remaining,current)
    letters = @map[remaining.shift]
    if letters
      letters.split(//).each do |l|
        word = current + l
        if remaining.length == 0
          @combos.push(word)
        else
          build_words([remaining].flatten,word)
        end
      end
    end  
  end
end

File.open(ARGV[0]).each_line do |line|
  puts PhoneNumber.new(line.strip).possible_words
end