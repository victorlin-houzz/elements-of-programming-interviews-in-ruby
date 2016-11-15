# 15.1 check if a bt a bst
def is_bst?(tree)
  return in_bst_range(tree, -999999999, 999999999)
end

def in_bst_range(tree, min, max)
  return true unless tree
  return false if tree.data < min || tree.data > max
  return is_bst_range(tree.left, min, tree.data) && in_bst_range(tree.right, tree.data, max)
end
