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
