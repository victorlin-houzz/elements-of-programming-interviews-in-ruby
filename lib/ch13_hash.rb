# 13.4 LCA with hash
# Time: O(D0 + D1), Space: O(D0 + D1)
def hash_lca(node0, node1)
  hash = Hash.new
  until node0.nil && node1.nil
    unless node0.nil
      if hash[node0]
        return node0
      else
        hash[node0] = 1
      end
      node0 = node0.parent
    end

    unless node1.nil
      if hash[node1]
        return node1
      else
        hash[node1] = 1
      end
      node1 = node1.parent
    end
  end
  nil
end

# 13.6 Find the nearest repeated entries in an array
# Time: O(n)
def find_nearest_repetition(arr)
  max_dis = nil
  hash = {}
  arr.each_with_index do |el, idx|
    if hash[el].nil?
      hash[el] = idx
    else
      distance = idx - hash[el]
      max_dis = distance if max_dis.nil? || (!max_dis.nil? && distance < max_dis)
    end
  end
  max_dis
end
