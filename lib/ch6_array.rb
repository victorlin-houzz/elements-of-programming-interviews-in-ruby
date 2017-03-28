# 6.0
# Swap even number to the front of the array.
# 2 pointers
# O(n) time and O(1) space.
def swap_even_odd(arr)
  even_idx = 0
  odd_idx = arr.length - 1
  while even_idx < odd_idx
    if arr[even_idx] % 2 == 0
      even_idx += 1
    else
      arr[even_idx], arr[odd_idx] = arr[odd_idx], arr[even_idx]
      # arr[even_idx] ^= arr[odd_idx]
      # arr[odd_idx] ^= arr[even_idx]
      # arr[even_idx] ^= arr[odd_idx]
      odd_idx -= 1
    end
  end
  arr
end

# 6.1
# Return an array with 3 sections: all the numbers
# less than the number at the index, all numbers equal to the number at the index, and then all
# greater than the number at the index.
# O(n) time and O(1) space.
def dutch_flag_partition(arr, idx)
  small_pivot = 0
  large_pivot = arr.length - 1
  equal = 0

  while equal <= large_pivot
    if arr[equal] < arr[idx]
      # p "swapping #{arr[small_pivot]} and #{arr[equal]}"
      arr[equal], arr[small_pivot] = arr[small_pivot], arr[equal]
      equal += 1
      small_pivot += 1
    elsif arr[equal] == arr[idx]
      equal += 1
    else
      # p "swapping #{arr[equal]} and #{arr[large_pivot]}"
      arr[equal], arr[large_pivot] = arr[large_pivot], arr[equal]
      large_pivot -= 1
    end
    # p arr
  end

  arr
end

# 6.6
# Return the idx pair for the max profit for buying & selling a stock.
# O(n) time and O(1) space.
def stock_max_profit(arr)
  max_profit = 0
  min = arr[0]
  min_idx = 0
  max_idx = 0
  1.upto(arr.length - 1) do |idx|
    if arr[idx] < min
      min_idx = idx
      min = arr[idx]
    end

    if (arr[idx] - min) > max_profit
      max_idx = idx
      max_profit = arr[idx] - min
    end
  end
  [min_idx, max_idx]
end

# 6.11
# Random subset of an array with size n
# O(n) time and O(1) space.
def random_subset(arr, n)
  sub_arr = arr.dup
  return nil if n > sub_arr.length
  0.upto(n) do |idx|
    rand_idx = rand(sub_arr.length)
    sub_arr[idx], sub_arr[rand_idx] = sub_arr[rand_idx], sub_arr[idx]
  end
  sub_arr[0...n]
end

#6.17
# Return an array in spiral order for a 2D array
# O(n^2) time and O(1) space.
def matrix_spiral(arr)
  shift = [[0,1], [1,0], [0,-1], [-1,0]]
  dup_arr = deep_dup(arr)
  p dup_arr
  out_arr = []
  idx = 0
  x = 0
  y = 0
  dir = 0

  while idx < dup_arr.length * dup_arr[0].length
    out_arr << dup_arr[x][y]
    next_x = x + shift[dir][0]
    next_y = y + shift[dir][1]
    dup_arr[x][y] = nil

    if next_x < 0 || next_x >= dup_arr.length ||
      next_y < 0 || next_y >= dup_arr[0].length || dup_arr[next_x][next_y] == nil
      dir = (dir + 1) % 4
    end

    x += shift[dir][0]
    y += shift[dir][1]
    idx += 1
  end
  # p out_arr
  out_arr
end

def deep_dup(arr)
  return arr if arr.length <= 1
  out_arr = []
  arr.each do |el|
    out_arr << (el.is_a?(Array) ? deep_dup(el) : el)
  end
  out_arr
end

# 6.18 Rotate an array clockwise or counter-clockwise
# O(n^2) time and O(1) space.
def rotate_matrix(arr, clockwise)
  dup_arr = deep_dup(arr)
  temp_arr = []
  size = dup_arr.length - 1
  0.upto(dup_arr.length / 2) do |i|
    i.upto(dup_arr.length - 2 - i) do |j|
      if clockwise
        # p "#{i}, #{j}"
        # p "#{dup_arr[i][j]}, #{dup_arr[j][size - i]}, #{dup_arr[size - i][size - j]}, #{dup_arr[size - j][i]}"
        dup_arr[i][j], dup_arr[j][size - i], dup_arr[size - i][size - j], dup_arr[size - j][i] =
        dup_arr[size - j][i], dup_arr[i][j], dup_arr[j][size - i], dup_arr[size - i][size - j]
        # p "#{dup_arr[i][j]}, #{dup_arr[j][size - i]}, #{dup_arr[size - i][size - j]}, #{dup_arr[size - j][i]}"

      else
        dup_arr[i][j], dup_arr[j][size - i], dup_arr[size - i][size - j], dup_arr[size - j][i] =
        dup_arr[j][size - i], dup_arr[size - i][size - j], dup_arr[size - j][i], dup_arr[i][j]
      end
    end
  end
  # p dup_arr
  dup_arr
end

# 6.19 Pascal's triangle
# O(n^2) time and O(1) space.
def pascal_triangle(n)
  return [[]] if n < 0
  return [[1]] if n == 1
  return [[1],[1,1]] if n == 2
  last_result = pascal_triangle(n - 1)
  last_row = last_result.last
  out_arr = [1]
  0.upto(last_row.length - 2) do |idx|
    out_arr << last_row[idx] + last_row[idx + 1]
  end
  out_arr << 1
  last_result << out_arr
end
