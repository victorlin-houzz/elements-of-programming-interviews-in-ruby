# 7.1
# Convert a number into string
def int_to_str(num)
  is_negative = num < 0
  in_num = num.abs
  out_str = ""
  while in_num > 0
    out_str = ('0'.ord + in_num % 10).chr + out_str
    in_num /= 10
  end
  out_str = "-" + out_str if is_negative
  out_str
end

# 7.1
# Convert a string to a number
def str_to_int(str)
  is_negative = true if str[0] == "-"
  start = is_negative ? 1 : 0
  num = 0
  start.upto(str.length - 1) do |idx|
    num = num * 10 + (str[idx, 1].ord - "0".ord)
  end
  return is_negative ? -num : num
end

# 7.5
# Check if a string is palindrome
def is_palindrome(str)
  out_str = str.downcase.gsub(/\W/, "")
  0.upto(out_str.length / 2) do |idx|
    return false if out_str[idx, 1] != out_str[out_str.length - idx - 1, 1]
  end
  true
end

# 7.6 Reverse words
def reverse_words(str)
  out_str = str.reverse
  out_str.split(" ").map{|word| word.reverse}.join(" ")
end

# 7.7 Look and say
def look_and_say(n)
  start = '1'
  n.times do |time|
    start = next_str(start)
  end
  start
end

def next_str(str)
  out_str = ""
  idx = 0
  while idx < str.length
    count = 1
    while idx < str.length - 1 && str[idx, 1] == str[idx + 1, 1]
      count += 1
      idx += 1
    end
    out_str += count.to_s + str[idx, 1]
    idx += 1
  end
  out_str
end


# 7.9 Convert from Roman to Decimal
def roman_to_dec(str)
  hash_roman = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
  }
  # From right to left; first set the num = the right most num
  num = hash_roman[str[str.length - 1, 1]]

  # Then compare if left < right, substract from num; else add to num
  (str.length - 2).downto(0).each do |idx|
    if hash_roman[str[idx, 1]] < hash_roman[str[idx + 1, 1]]
      num -= hash_roman[str[idx, 1]]
    else
      num += hash_roman[str[idx, 1]]
    end
  end
  num
end

# 7.10 Compute All Valid IP Address
def valid_ip?(str)
  return false unless str.match(/^\d+(\.\d+){3}$/)
  str.split('.').all?{|el| el.to_i >= 0 && el.to_i <= 255}
end

# 7.11 Print out snake output
def snake_string(str)
  out_arr = []
  arr1 = []
  arr2 = []
  arr3 = []

  first_idx = 1
  while first_idx < str.length
    arr1 << str[first_idx, 1]
    arr2 << ""
    arr3 << ""
    first_idx += 4
  end

  second_idx = 0
  while second_idx < str.length
    arr1 << ""
    arr2 << str[second_idx, 1]
    arr3 << ""
    second_idx += 2
  end

  third_idx = 3
  while third_idx < str.length
    arr1 << ""
    arr2 << ""
    arr3 << str[third_idx, 1]
    third_idx += 4
  end

  out_arr << arr1
  out_arr << arr2
  out_arr << arr3
  out_arr
end

# 7.12 RLE Encoding & Decoding

def rle_encoding(str)
  idx = 0
  out_str = ""
  while idx < str.length
    count = 1
    while idx + 1 < str.length && str[idx,1] == str[idx + 1,1]
      count += 1
      idx += 1
    end
    out_str += count.to_s + str[idx]
    idx += 1
  end
  out_str
end

def rle_decoding(str)
  idx = 0
  out_str = ""
  while idx < str.length
    count = str[idx, 1].to_i
    while count > 0
      out_str += str[idx + 1, 1]
      count -= 1
    end
    idx += 2
  end
  out_str
end

def substring_idx(str, sub_str)
  out_arr = []
  hash = sub_str.hash
  0.upto(str.length - sub_str.length).each do |idx|
    out_arr << idx if str[idx, sub_str.length].hash == hash
  end
  out_arr
end
