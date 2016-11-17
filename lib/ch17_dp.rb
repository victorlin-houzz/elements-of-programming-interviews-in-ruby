# 17.0 Fib seq
# Time: O(n)
def fib_seq(n)
  cache = {}
  fib(n, cache)
end

def fib(n, cache)
  return n if n < 2
  unless cache[n]
    cache[n] = fib(n - 1, cache) + fib(n - 2, cache)
  end
  cache[n]
end

# 17.0.1 Max sum subarray
def max_subarr(arr)
  max = 0
  min = 0
  sum = 0
  arr.each do |el|
    sum += el
    min = sum if sum < min
    max = sum - min if max < sum - min
  end
  max
end

# 17.1 Count how many ways of coin change
=begin
     Amount   0  1  2  3  4  5
Coin
0            [1, 0, 0, 0, 0, 0],
1            [1, 1, 1, 1, 1, 1],
2            [1, 1, 2, 2, 3, 3],
3            [1, 1, 2, 3, 4, 5]
=end
def coin_change(amount, coins = [1,2,3])
  solution = Array.new(coins.length + 1){Array.new(amount + 1)}

  # Base case are always 1 way, where amount = 0
  0.upto(coins.length).each do |i|
    solution[i][0] = 1
  end

  # Base case for coin 0, always 0 way
  1.upto(amount).each do |j|
    solution[0][j] = 0
  end

  1.upto(coins.length).each do |i|
    1.upto(amount).each do |j|
      # check if the coin value is less than the amount needed
      if coins[i - 1] <= j
        # reduce the amount by coin value and
        # use the subproblem solution (amount-v[i]) and
        # add the solution from the top to it
        solution[i][j] = solution[i - 1][j] + solution[i][j - coins[i - 1]]
      else
        # just copy the value from the top
        solution[i][j] = solution[i - 1][j];
      end
    end
  end
  solution
end

def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0

  # Optimization: make sure coins are always sorted descending in
  # size. We'll see why later.
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    if target < coin
      # can't use this coin, it's too big
      next
    else
      remainder = target - coin
    end

    best_remainder = make_change(remainder, coins.drop(index))

    # We may not be able to make the remaining amount of change (e.g.,
    # if coins doesn't have a 1cent piece), in which case we shouldn't
    # use this coin.
    if best_remainder.nil?
      next
    else
      this_change = [coin] + best_remainder
    end

    # Is this better than anything we've seen so far?
    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end
  best_change
end

# 17.2 CODE NOT WORKING!!!!
# 17.2 Compute Levenshtein distance
# def levenshtein_distance(str_a, str_b)
#   dis_arr = Array.new(str_a.length){Array.new(str_b.length){-1}}
#   compute_dis(str_a, str_a.length - 1, str_b, str_b.length - 1, dis_arr)
# end
#
# def compute_dis(str_a, idx_a, str_b, idx_b, dis_arr)
#   # str_a is empty, so add all str_b char
#   if idx_a < 0
#     return idx_b + 1
#   elsif idx_b < 0
#     return idx_a + 1
#   end
#
#   if dis_arr[idx_a][idx_b] == -1
#     if str_a[idx_a, 1] == str_b[idx_b, 1]
#       compute_dis(str_a, idx_a - 1, str_b, idx_b - 1, dis_arr)
#     else
#       sub_last_a_with_last_b = compute_dis(str_a, idx_a - 1, str_b, idx_b - 1, dis_arr)
#       add_last = compute_dis(str_a, idx_a, str_b, idx_b - 1, dis_arr)
#       delete_last = compute_dis(str_a, idx_a - 1, str_b, idx_b, dis_arr)
#       dis_arr[idx_a][idx_b] = 1 + [sub_last_a_with_last_b, add_last, delete_last].min
#     end
#   end
#   p dis_arr
#   dis_arr[idx_a][idx_b]
# end

# 17.3 Count number of ways to go from 0,0 to m,n in a 2-D array
# Time: O(mn)
# Space: O(mn)
def walk_array(m,n)
  arr = Array.new(m){Array.new(n)}
  result = compute_walk(m - 1, n - 1, arr)
  return result
end

def compute_walk(x, y, arr)
  return 1 if x == 0 || y == 0
  way_top = x == 0 ? 0 : compute_walk(x - 1, y, arr)
  way_left = x == 0 ? 0 : compute_walk(x, y - 1, arr)
  arr[x][y] = way_top + way_left
  arr[x][y]
end
