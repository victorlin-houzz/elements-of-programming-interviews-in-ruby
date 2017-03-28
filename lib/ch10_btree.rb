class BSTNode
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end


# 10.2 Check if a tree is symmetric
def symmetric_tree?(root)
  return true unless root
  if root.right.nil? || root.left.nil?
    return false
  else
    return check_symmetric(root.left, root.right)
  end
  return false
end

def check_symmetric(left, right)
  return left.data == right.data &&
  check_symmetric(left.left, right.right) &&
  check_symmetric(left.right, right.left)
end

# 10.4 if Node has parent, find LCA (Lowest common ancestor)
# Time O(h), Space O(1)
def parent_lca(node1, node2)
  # Find the min_depth
  n1_depth = find_depth(node1)
  n2_depth = find_depth(node2)
  if n2_depth > n1_depth
    node1, node2 = node2, node1
  end

  # Make sure 2 nodes has the same depth
  diff_depth = (n1_depth - n2_depth).abs
  while diff_depth > 0
    node1 = node1.parent
    diff_depth -= 1
  end

  until node1.parent.nil?
    return node1 if node1 == node2
    node1 = node1.parent
    node2 = node2.parent
  end

  nil
end

def find_depth(node)
  depth = 0
  until node.parent.nil?
    depth += 1
  end
  return depth
end

# 10.5 sum the root to leaf binary tree

def sum_binary(root)
  return partial_sum(root, 0)
end

def partial_sum(node, curr_sum)
  return 0 if node.nil?
  curr_sum = curr_sum * 2 + node.data
  if node.left.nil? && node.right.nil?
    return curr_sum
  else
    return partial_sum(node.left, curr_sum) + partial_sum(node.right, curr_sum)
  end
end


# 10.6, similar to 10.5, find the target sum

def target_sum(root, target_sum)
  return partial_target_sum(root, target_sum, 0)
end

def partial_target_sum(node, target_sum, curr_sum)
  return false if node.nil?
  curr_sum += node.data
  return true if curr_sum == target_sum
  return partial_target_sum(node.left, target_sum, curr_sum) || partial_target_sum(right, target_sum, curr_sum)
end

# 10.7 BST inorder
def bst_inorder(root)
  result = []
  stack = []
  curr = root
  until curr.nil? && result.empty?
    if !curr.nil?
      # Going left
      stack.push(curr)
      curr = curr.left
    else
      # Going up
      curr = stack.pop
      result << curr

      # Going right
      curr = curr.right

    end
  end
  result
end

# 10.8 BST preorder
def bst_preorder(root)
  result = []
  stack = [root]
  until stack.empty?
    curr = stack.pop
    unless curr.nil?
      result << curr
      stack.push(curr.right)
      stack.push(curr.left)
    end
  end
  result
end

# 10.9 Find Kth node inorder BTree
def find_kth_node(root, k)

end

# 10.10 find successor inorder BTree
def find_successor(node)
  iter = node

  # find the left most node in right sub tree
  unless iter.right.nil?
    iter = iter.right
    until iter.left.nil?
      iter = lter.left
    end
    return iter
  end

#           A
#          /
#         B
#        / \
#       C   D   => C,B,D,A => A is D's successor
  # find the closest ancestor whose left subtree contains node.
  while iter.parent != null && iter.parent.right == iter
    iter = iter.parent
  end
  return iter.parent
end
