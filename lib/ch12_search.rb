# 12.1 search a sorted array for first occurrence of k
# arr = [0,4,5,5,5,7,7,9,10,11,12], k = 5, out = 2
# Time: O(logn)
def search_first_of_k(arr, k)
  result = nil
  left = 0
  right = arr.length - 1
  while left <= right
    mid = left + (right - left) / 2
    if arr[mid] == k
      result = mid
      right = mid - 1
    elsif arr[mid] > k
      right = mid - 1
    else
      left = mid + 1
    end
  end
  result
end

# 12.3 search the smallest element in a cyclically array
# arr = [5,6,7,8,9,10,1,2], out = index 5

def search_the_smallest(arr)
  mid = nil
  left = 0
  right = arr.length - 1
  while left < right
    mid = left + (right - left) / 2
    if arr[mid] > arr[right]
      left = mid + 1
    else
      right = mid
    end
  end
  left
end

# 12.4 find the largest x ,where x^2 < k, and (x + 1)^2 > k
def find_closest_sq_root(k)
  left = 0
  right = k
  while left <= right
    mid = left + (right - left) / 2
    right = mid - 1 if mid * mid > k
    left = mid + 1 if mid * mid <= k
  end
  return left - 1
end
