class BSTNode
  attr_accessor :left, :right
  attr_reader :key

  def initialize(key = nil, left = nil, right = nil)
    @key = key
    @left = left
    @right = right
  end
end

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(key)
    if !@root
      @root = BSTNode.new(key)
      return
    end

    BinarySearchTree.insert!(@root, key)
  end

  def find(key)
    BinarySearchTree.find!(@root, key)
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

  def delete(key)
    @root = BinarySearchTree.delete!(@root, key)
  end

  def self.insert!(node, key)
    return BSTNode.new(key) unless node
    if key <= node.key
      node.left = self.insert!(node.left, key)
    else
      node.right = self.insert!(node.right, key)
    end
    node
  end

  def self.find!(node, key)
    return nil unless node
    return node if node.key == key
    if key < node.key
      return self.find!(node.left, key)
    end
    return self.find!(node.right, key)
  end

  def self.preorder!(node)
    return [] unless node
    arr = [node.key]
    arr += self.preorder!(node.left) if node.left
    arr += self.preorder!(node.right) if node.right
    arr
  end

  def self.inorder!(node)
    return [] unless node
    arr = []
    arr += self.preorder!(node.left) if node.left
    arr << node.key
    arr += self.preorder!(node.right) if node.right
    arr
  end

  def self.postorder!(node)
    return [] unless node
    arr = []
    arr += self.postorder!(node.left) if node.left
    arr += self.postorder!(node.right) if node.right
    arr << node.key
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

  def self.delete!(node, key)
    return nil unless node
    if key < node.key
      node.left = self.delete!(node.left, key)
    elsif key > node.key
      node.right = self.delete!(node.right, key)
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
