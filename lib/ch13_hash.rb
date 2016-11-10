# 13.1: take in a string and return whether any of it's permutations are palindromes
# Time: O(n)
def per_palindromes?(str)
  hash = Hash.new{0}

  # Find the frequency for each char
  str.chars.each do |c|
    hash[c] += 1
  end

  odd_count = 0
  hash.each do |key, value|
    odd_count += 1 unless value % 2 == 0
    return false if odd_count > 1
  end
  true
end

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

# 13.10 Find the length of a longest contain interval
=begin
arr = [3,7,1,2,0,9,11]
range = 0,1,2,3 => 4
=end
require 'set'
def longest_contained_range(arr)
  unprocessed_set = arr.to_set
  range = 0
  until unprocessed_set.empty?
    itr = unprocessed_set.each
    el = itr.next
    unprocessed_set.delete(el)

    # Find the continuous numbers from the arr
    lower_bound = el - 1
    while unprocessed_set.include?(lower_bound)
      unprocessed_set.delete(lower_bound)
      lower_bound -= 1
    end

    upper_bound = el + 1
    while unprocessed_set.include?(upper_bound)
      unprocessed_set.delete(upper_bound)
      upper_bound += 1
    end
    range = [range, upper_bound - lower_bound - 1].max
  end
  range
end
