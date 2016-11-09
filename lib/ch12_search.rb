# search a sorted array for first occurrence of k
# arr = [0,4,5,5,5,7,7,9,10,11,12], k = 5, out = 2
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
