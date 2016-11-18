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
