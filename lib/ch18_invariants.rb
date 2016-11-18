# 18.4.0 Two Sum for a sorted array
# Time: O(n)
# Space: O(1)
# arr = [-2,1,2,4,7,11]
def has_two_sum?(arr, target)
  i = 0
  j = arr.length - 1
  while i < j
    if arr[i] + arr[j] == target
      return true
    elsif arr[i] + arr[j] < target
      i += 1
    else
      j -= 1
    end
  end
  false
end

# 18.4 Three sum for un-sorted array
# Time: O(n ^ 2)
# Space: O(n) - with hash table

# arr = [-2,1,2,4,7,11]
# target: 10
def three_sum?(arr,target)
  hash = {}
  arr.each do |el|
    hash[target - el] = true
  end
  0.upto(arr.length - 2) do |i|
    (i + 1).upto(arr.length - 1) do |j|
      return true if hash[arr[i] + arr[j]]
    end
  end
  false
end

# Time: O(n ^ 2) - with Sorted array, can use prev two_sum? method
# Space: O(1)
def better_three_sum?(arr, target)
  arr.sort!
  arr.each do |el|
    return true if has_two_sum?(arr, target - el)
  end
  false
end

# 18.5 Find the majority char in a string
# Time: O(n)
# Space: O(k) - distinct chars in the string

def majority_char(str)
  hash = Hash.new(){0}
  str.each_char do |c|
    hash[c] += 1
  end
  max = hash.values.max
  str.each_char.select do |c|
    hash[c] == max
  end.first
end

# Time: O(n)
# Space: O(1) - Use counter
def better_majority_char(str)
  candidate = ""
  count = 0
  str.each_char do |c|
    if count == 0
      candidate = c
      count = 1
    elsif candidate == c
      count += 1
    else
      count -= 1
    end
  end
  candidate
end

# 18.7 Max water (area) for a pair of vertical lines
# heights = [1,2,1,3,4,5,5,6,7,2,1,3,1,3,2,1,2,4,1]
# Time: O(n)
# Space: O(1)
def max_water(heights)
  i = 0
  j = heights.length - 1
  max = 0
  while i < j
    max = [[heights[i], heights[j]].min * (j - i), max].max
    if heights[i] < heights[j]
      i += 1
    elsif heights[i] > heights[j]
      j -= 1
    else
      i += 1
      j -= 1
    end
  end
  max
end
