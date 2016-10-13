# 6.0
# Swap even number to the front of the array.
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
    p arr
  end

  arr
end
