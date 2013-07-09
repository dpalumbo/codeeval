class Ugly
  def initialize(num)
    @num = num
  end

  def ugly_combo_count(remaining,current,pos)
    if remaining.length - pos < 2 
      @total += 1 if is_ugly(current + remaining.to_i)
    else
      ugly_combo_count(remaining[(pos + 1)..-1],current + remaining[0..pos].to_i,0)
      ugly_combo_count(remaining[(pos + 1)..-1],current - remaining[0..pos].to_i,0)
      ugly_combo_count(remaining,current, pos + 1)
    end
  end

  def is_ugly(n)
    (n % 2 == 0) || (n % 3 == 0) || (n % 5 == 0) || (n % 7 == 0)
  end

  def just_how_ugly_is_it
    @total = 0
    ugly_combo_count(@num,0,0)
    return @total
  end
end

File.open(ARGV[0]).each_line do |line|
  puts Ugly.new(line.strip).just_how_ugly_is_it
end