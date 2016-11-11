# 14.1
# Find the intersection of 2 sorted arrays
# Time: O(m + n), space: O(1)
def find_intersection(arr1, arr2)
  i = 0
  j = 0
  out_arr = []
  while i < arr1.length && j < arr2.length
    if arr1[i] == arr2[j]
      out_arr << arr1[i]
      i += 1
      j += 1
    elsif arr1[i] < arr2[j]
      i += 1
    else
      j += 1
    end
  end
  out_arr
end

# 14.2 Merge 2 sorted array to the first array,
# assuming the first array has enough empty space at the end of the array.

# arr1 = [5,13,17,nil,nil,nil,nil,nil], arr2 = [3,7,11,19], m = 3, n = 4
# output arr1 = [3,5,7,11,13,17,19,nil]
def merge_sorted_arrays(arr1, arr2, m, n)
  a = m - 1
  b = n - 1
  curr_idx = m + n - 1
  while a >= 0 && b >= 0
    if arr1[a] > arr2[b]
      arr1[curr_idx] = arr1[a]
      curr_idx -= 1
      a -= 1
    else
      arr1[curr_idx] = arr2[b]
      curr_idx -= 1
      b -= 1
    end
  end
  while b >= 0
    arr1[curr_idx] = arr2[b]
    curr_idx -= 1
    b -= 1
  end
  return arr1
end
