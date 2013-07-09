class Node
  attr_accessor :data, :left, :right

  def initialize(data,left,right)
    @data = data
    @left = left
    @right = right
  end

  def self.get_node_from_data(root,data)
    #only gets first match
    return nil if root.nil?
    return root if root.data == data
    left = get_node_from_data(root.left,data) 
    right = get_node_from_data(root.right,data) 
    return left if !left.nil?  
    return right if !right.nil?  
  end
  
  def self.lca(root,a,b)
    return nil if root.nil?
    return root if root == a || root == b
    left = lca(root.left,a,b)
    right = lca(root.right,a,b)
    return root if left && right
    return left if left
    return right if right
  end
end

root = Node.new(30,Node.new(8,Node.new(3,nil,nil),Node.new(20,Node.new(10,nil,nil),Node.new(29,nil,nil))),Node.new(52,nil,nil))

File.open(ARGV[0]).each_line do |line|
  one, two = line.strip.split.map(&:to_i)
  lca = Node.lca(root, Node.get_node_from_data(root,one), Node.get_node_from_data(root,two))
  puts lca.data if !lca.nil?
end