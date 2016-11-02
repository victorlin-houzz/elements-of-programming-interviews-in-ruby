class BTreeNode

  def initialize(value)
    @data = value
    @right = nil
    @left = nil
  end

  def add_right(value)
    right = BTreeNode.new(value)
    this.right = right
  end

  def add_left(value)
    left = BTreeNode.new(value)
    this.left = left
  end

end
