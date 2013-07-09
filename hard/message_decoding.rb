def generate_keys(num_groups)
  keys = []
  for i in 1..num_groups
    x=0
    str="0"*i
    while str!="1"*i
      keys.push(str)
      x+=1
      str=sprintf "%0#{i}b", x
    end
  end
  return keys
end

def build_map(head,keys)
  map = {}
  for i in 0..(head.length-1)
    map[keys[i]]=head[i]
  end
  return map
end

def decode_message(map,msg)
  message=""
  i=0
  while i<msg.length
    seg_length = msg[i..i+2].to_i(2)
    return message if seg_length==0
    i+=3
    until msg[i..(i+seg_length-1)]=="1"*seg_length
      message+=map[msg[i..(i+seg_length-1)]]
      i+=seg_length
    end 
    i+=seg_length   
  end
end

File.open(ARGV[0]).each_line do |line|
  msg_start = line.index(/0|1/)
  header = line[0..(msg_start-1)]
  message = line[msg_start..(line.length-1)]
  keys = generate_keys(6)
  map = build_map(header,keys)
  puts decode_message(map,message) 
end