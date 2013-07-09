require 'cgi'

def uri_match(a, b) 
  a = CGI.unescape(a.downcase)
  b = CGI.unescape(b.downcase)
  a_group = a.split("/")
  b_group = b.split("/")
  return false unless a_group.length == b_group.length && a_group.length > 2
  a_domain, a_port = a_group[2].split(":")
  b_domain, b_port = b_group[2].split(":")
  a_group[2] = a_domain
  b_group[2] = b_domain
  return false unless ((a_port.nil? || a_port == "80") && (b_port.nil? || b_port == 80)) || a_port == b_port
  for i in 0...a_group.length
    return false unless a_group[i] == b_group[i]
  end
  return true
end

File.open(ARGV[0]).each_line do |line|
  a, b = line.strip.split(";")
  puts uri_match(a, b) ? "True" : "False"
end