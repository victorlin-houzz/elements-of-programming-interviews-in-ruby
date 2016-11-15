class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  # def insert(value)
  #   if !@root
  #     @root = BSTNode.new(value)
  #     return
  #   end
  #
  #   BinarySearchTree.insert!(@root, value)
  # end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    @root = BinarySearchTree.delete!(@root, value)
  end

  def insert(value)
    unless @root
      @root = BSTNode.new(value)
      return @root
    end
    node = @root
    until node
      parent = node
      if value < node.value
        node = node.left
      elsif value > node.value
        node = node.right
      else
        p "Duplicated Key is inserted"
        raise "Duplicated Key is inserted"
        return node
      end
    end
    new_node = BSTNode.new(value)
    if value < parent.value
      parent.left = new_node
    else
      parent.right = new_node
    end
    new_node
  end

  def self.insert!(node, value)
    return BSTNode.new(value) unless node
    if value <= node.value
      node.left = self.insert!(node.left, value)
    else
      node.right = self.insert!(node.right, value)
    end
    node
  end

  def self.find!(node, value)
    return nil unless node
    return node if node.value == value
    if value < node.value
      return self.find!(node.left, value)
    end
    return self.find!(node.right, value)
  end

  def self.preorder!(node)
    return [] unless node
    arr = [node.value]
    arr += self.preorder!(node.left) if node.left
    arr += self.preorder!(node.right) if node.right
    arr
  end

  def self.inorder!(node)
    return [] unless node
    arr = []
    arr += self.preorder!(node.left) if node.left
    arr << node.value
    arr += self.preorder!(node.right) if node.right
    arr
  end

  def self.postorder!(node)
    return [] unless node
    arr = []
    arr += self.postorder!(node.left) if node.left
    arr += self.postorder!(node.right) if node.right
    arr << node.value
    arr
  end

  def self.height!(node)
    return -1 unless node
    1 + [self.height!(node.left), self.height!(node.right)].max
  end

  def self.max(node)
    return nil unless node
    return node unless node.right
    self.max(node.right)
  end

  def self.min(node)
    return nil unless node
    return node unless node.left
    self.min(node.left)
  end

  def self.delete_min!(node)
    return nil unless node
    return node.right unless node.left
    node.left = BinarySearchTree.delete_min!(node.left)
    node
  end

  def self.delete!(node, value)
    return nil unless node
    if value < node.value
      node.left = self.delete!(node.left, value)
    elsif value > node.value
      node.right = self.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      temp = node
      node = temp.right.min
      node.right = BinarySearchTree.delete_min!(temp.right)
      node.left = temp.left
    end
    node
  end
end
A = BSTNode.new(19)
B = BSTNode.new(7)
C = BSTNode.new(3)
D = BSTNode.new(2)
E = BSTNode.new(5)
F = BSTNode.new(11)
G = BSTNode.new(17)
H = BSTNode.new(13)
I = BSTNode.new(43)
J = BSTNode.new(23)
K = BSTNode.new(37)
L = BSTNode.new(29)
M = BSTNode.new(31)
N = BSTNode.new(43)
O = BSTNode.new(47)
P = BSTNode.new(53)
A.left = B
A.right = I
B.left = C
B.right = F
C.left = D
C.right = E
F.right = G
G.left = H
I.left = J
I.right = O
J.right = K
K.left = L
K.right = N
L.right = M
O.right = P
bst = BinarySearchTree.new
bst.root = A
