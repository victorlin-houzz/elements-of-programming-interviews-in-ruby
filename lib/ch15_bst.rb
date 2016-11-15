require 'bst'

# 15.1 check if a bt a bst
def is_bst?(tree)
  return in_bst_range(tree, -999999999, 999999999)
end

def in_bst_range(tree, min, max)
  return true unless tree
  return false if tree.data < min || tree.data > max
  return is_bst_range(tree.left, min, tree.data) && in_bst_range(tree.right, tree.data, max)
end

# 15.2 find the first node that is greater than input in BST
# Time: O(h)
def find_first_key(tree, value)
  sub_tree = tree
  curr = nil
  until sub_tree
    if sub_tree.data > k
      curr = sub_tree
      # Go left
      sub_tree = sub_tree.left
    else
      # Go right
      sub_tree = sub_tree.right
    end
  end
  curr
end

# 15.3 Find the K largest elements in BST, reverse order
# Time: O(h + k)
def find_k_largest_bst(tree, k, arr = [])
  if !tree.nil? && arr.length < k
    find_k_largest_bst(tree.right, k, arr)
    if arr.length < k
      arr << tree.data
      find_k_largest_bst(tree.left, k, arr)
    end
  end
  # p "returning... #{tree.data}" if tree
  arr
end

#15.4 Find the LCA for BST
# Time: O(h)
def find_lca_bst(root, left_node, right_node)
  node = root

  # Start from root, looking for a node > left_node.data && < right_node.data
  while node.data < left_node.data || node.data > right_node.data
    while node.data < left_node.data
      node = node.right
    end
    while node.data > right_node.data
      node = node.left
    end
  end

  # Now node.data >= left_node.data && node.data <= right_node.data, which is the LCA
  return node
end

# 15.5 Reconstruct Preorder BST
# Time: O(n)
def preorder_bst(seq)
  $curr_idx = 0
  return rebuild_bst_preorder(seq, -9999999, 9999999)
end

def rebuild_bst_preorder(seq, min, max)
  return nil if $curr_idx == seq.length
  curr_root = seq[$curr_idx]
  return nil if curr_root < min || curr_root > max

  $curr_idx += 1
  left = rebuild_bst_preorder(seq, min, curr_root)
  right = rebuild_bst_preorder(seq, curr_root, max)
  return BSTNode.new(curr_root, left, right)
end

# 15.7 Generate K number of ABSqrt2, where a & b >=0
# Time: O(n)

class ABSqrt2
  attr_accessor :a, :b
  attr_reader :val
  def initialize(a, b)
    @a = a
    @b = b
    @val = a + b * Math.sqrt(2)
  end
end

def generate_absqrt2(k)
  return [] if k < 1
  result = []
  result << ABSqrt2.new(0,0)
  i, j = 0, 0
  1.upto(k).each do |n|
    result_i_plus_one = ABSqrt2.new(result[i].a + 1, result[i].b)
    result_j_plus_one = ABSqrt2.new(result[j].a, result[j].b + 1)
    if result_i_plus_one.val < result_j_plus_one.val
      i += 1
      result << result_i_plus_one
    elsif result_i_plus_one.val > result_j_plus_one.val
      j += 1
      result << result_j_plus_one
    else
      i += 1
      j += 1
      result << result_i_plus_one
    end
  end
  result
end
