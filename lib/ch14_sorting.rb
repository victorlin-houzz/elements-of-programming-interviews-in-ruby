# 14.1
# Find the intersection of 2 sorted arrays
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
