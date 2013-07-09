def lcs(a, b)
  lookup = build_lookup(a,b)
  return lcs_from_lookup(a,b,a.length,b.length,lookup).join
end

def build_lookup(a,b)
  #dynamic programming solution
  lookup = {}
  for i in 0..a.length   
    for j in 0..b.length
      if i == 0 || j == 0
        lookup[[i,j]] = 0
      elsif a[i-1] == b[j-1]
        lookup[[i,j]] = lookup[[i-1, j-1]] + 1
      else
        lookup[[i,j]] = [lookup[[i-1, j]], lookup[[i, j-1]]].max
      end
    end
  end
  return lookup
end

def lcs_from_lookup(a, b, i, j,lookup)
  if i == 0 || j == 0
    return []
  elsif a[i-1] == b[j-1]
    return lcs_from_lookup(a, b, i-1, j-1,lookup) + [a[i-1]]
  elsif lookup[[i-1, j]] > lookup[[i, j-1]]
    return lcs_from_lookup(a, b, i-1, j, lookup)
  else
    return lcs_from_lookup(a, b, i, j-1, lookup)
  end  
end

File.open(ARGV[0]).each_line do |line|
  str1, str2 = line.strip.split(";")
  puts lcs(str1, str2) if !str1.nil? && !str2.nil?
end