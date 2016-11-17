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
1            [1, 1, 1, 1, 1, 1],
2            [1, 1, 2, 2, 3, 3],
3            [1, 1, 2, 3, 4, 5]
=end
def coin_change(amount, coins = [1,2,3])
  solution = Array.new(coins.length){Array.new(amount + 1)}

  # Base case are always 1 way, where amount = 0
  0.upto(coins.length - 1).each do |i|
    solution[i][0] = 1
  end

  # Base case for coin 1, always 0 way
  1.upto(amount).each do |j|
    solution[0][j] = 1
  end

  1.upto(coins.length - 1).each do |i|
    1.upto(amount).each do |j|
      # check if the amount needed is less than the coin value
      if j < coins[i]
        # just copy the value from the top
        solution[i][j] = solution[i - 1][j];
      else
        # reduce the amount by coin value and
        # use the subproblem solution (amount-v[i]) and
        # add the solution from the top to it
        solution[i][j] = solution[i - 1][j] + solution[i][j - coins[i]]
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

# 17.4 Binomial Coefficient
# Time: O(nk)
# Space: O(nk)
def binomial_coefficient(n, k)
  arr = Array.new(n + 1){Array.new(k + 1)}
  compute_bc(n, k, arr)
end

# (n,k) = 0 if n == 0
# (n,k) = 1 if k == 0
# (n,k) = 1 if n == k

def compute_bc(n, k, arr)
  return 0 if n == 0
  return 1 if n == k || k == 0
  unless arr[n][k]
    arr[n][k] = compute_bc(n - 1, k, arr) + compute_bc(n - 1, k - 1, arr)
  end
  arr[n][k]
end

# 17.6 Knapsack problem
class Item
  attr_accessor :value, :weight

  def initialize(value, weight)
    @value = value
    @weight = weight
  end
end
i1 = Item.new(60, 5)
i2 = Item.new(50, 3)
i3 = Item.new(70, 4)
i4 = Item.new(30, 2)
items = [i1, i2, i3, i4]

=begin
      weight 0  1   2   3   4   5
  item
    i1      [0, 0,  0,  0,  0, 60],
    i2      [0, 0,  0, 50, 50, 60],
    i3      [0, 0,  0, 50, 70, 70],
    i4      [0, 0, 30, 50, 70, 80]
=end
# Time: O(nw)
# Space: O(nw)
def knapsack(items, capacity)
  result = Array.new(items.length) {Array.new(capacity + 1)}
  0.upto(items.length - 1).each do |i|
    result[i][0] = 0
    1.upto(capacity).each do |j|
      without_curr = result[i - 1][j]

      # If current weight is less than current item's weight
      if j < items[i].weight
        result[i][j] = (i - 1) >= 0 ? without_curr : 0
      else
        result[i][j] = (i - 1) >= 0 ?
        # Max of Current item value + value from same row but Value[j - W[i]], or the value from the top
        [without_curr, items[i].value + result[i][j - items[i].weight]].max :
        # Current item value + value from same row but Value[j - W[i]]
        items[i].value + result[i][j - items[i].weight]
      end
    end
  end
  result
end

# 17.8 Find the minumum weight path in a triangle
=begin
triangle = [['2'],
          [4,'4'],
         [8,'5',6],
        [4,'2',6,2],
       [1,5,'2',3,4]]
Min Weight would be 2 + 4 + 5 + 2 + 2 = 15
=end
def min_path_triangle(triangle)
  if triangle.empty?
    return []
  end
  prev_row = triangle.first
  1.upto(triangle.length - 1).each do |i|
    curr_row = triangle[i]

    # For the first element
    curr_row[0] = prev_row[0] + curr_row[0]

    # Elements in between, exclude the last element
    1.upto(curr_row.length - 2).each do |j|
      curr_row[j] = curr_row[j] + [prev_row[j - 1], prev_row[j]].min
    end

    # Last element
    curr_row[curr_row.length - 1] = curr_row[curr_row.length - 1] + prev_row[prev_row.length - 1]
    prev_row = curr_row
  end
  prev_row.min
end
