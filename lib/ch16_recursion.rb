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
