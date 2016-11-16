# 15.1 Tower of Hanoi
def compute_tower_of_hanoi(nums)
  # Setup
  num_pegs = 4
  pegs = []
  num_pegs.times do |time|
    pegs << []
  end
  (nums - 1).downto(0).each do |num|
    pegs[0] << num
  end
  p pegs
  compute_toh(nums, pegs, 0,1,2)
end

def compute_toh(nums, pegs, from, to, via)
  if nums > 0
    compute_toh(nums - 1, pegs, from, via, to)
    pegs[to] << pegs[from].pop
    p 'moving from peg ' + from.to_s + ' to peg ' + to.to_s + ' --- Disk ' + pegs[to].last.to_s
    compute_toh(nums - 1, pegs, via, to, from)
  end
end

# 16.3 Generate permutations
def permutations(input)
  result = []
  build_permutations(input, 0, result)
end

def build_permutations(input, i, result)
  if i == (input.length - 1)
    result << input.dup
    return result
  end
  j = i
  while j < input.length
    input[i], input[j] = input[j], input[i]
    build_permutations(input, i + 1, result)
    input[i], input[j] = input[j], input[i]
    j += 1
  end
  return result
end

# 16.6 Generate Strings of matched parens
def generate_balanced_parens(num_pairs)
  result = []
  build_balanced_parens(num_pairs, num_pairs, "", result)
end

def build_balanced_parens(num_left_parens_needed, num_right_parens_needed, valid_prefix, result)
  if num_left_parens_needed == 0 && num_right_parens_needed == 0
    result << valid_prefix
    return
  end
  # Able to insert (
  if num_left_parens_needed > 0
    build_balanced_parens(num_left_parens_needed - 1, num_right_parens_needed, valid_prefix + "(", result)
  end

  # Able to insert )
  if num_left_parens_needed < num_right_parens_needed
    build_balanced_parens(num_left_parens_needed, num_right_parens_needed - 1, valid_prefix + ")", result)
  end
  result
end

# 16.7 Generate Palindromic decompositions
# Time: O(n 2^n)
def generate_palindromic_decompositions(input)
  result = []
  build_palindromic_compositions(input, 0, [], result)
end

def build_palindromic_compositions(input, start, partial_partition, result)
  # Base case
  if start == input.length
    result << partial_partition.dup
    return
  end

  # partition
  ending = start + 1
  while ending <= input.length
    prefix = input[start...ending]
    if is_palindrome?(prefix)
      partial_partition << prefix
      build_palindromic_compositions(input, ending, partial_partition, result)
      partial_partition.pop
    end
  ending += 1
  end
  result
end

def is_palindrome?(str)
  0.upto(str.length / 2).each do |idx|
    return false unless str[idx, 1] == str[str.length - idx - 1, 1]
  end
  return true
end

# 16.8 Generate BTree with n nodes
def generate_btree(n)
  result = []
  result << nil if n == 0
  left_node = 0
  while left_node < n
    right_node = n - left_node - 1
    left_sub_trees = generate_btree(left_node)
    right_sub_trees = generate_btree(right_node)
    left_sub_trees.each do |left|
      right_sub_trees.each do |right|
        result << BSTNode.new(n, left, right)
      end
    end
    left_node += 1
  end
  result
end

# 16.10 Generate n-bit gray code
# Time: O(2^n)
def graycode(n)
  # Base case
  if n == 0
    return [0]
  elsif n == 1
    return [0, 1]
  end
  prev_codes = graycode(n - 1)
  leading_bit_one = 1 << (n - 1)
  reflection = []

  # Here we want to reverse to prepend the leading one to prev_codes,
  # in order to get the gray codes differ in one place on wrapping around.
  (prev_codes.length - 1).downto(0).each do |i|
    reflection << (leading_bit_one | prev_codes[i])
  end
  prev_codes + reflection
end
