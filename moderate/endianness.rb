if [1].pack("I") == [1].pack("N")
  puts "BigEndian"
else
  puts "LittleEndian"
end