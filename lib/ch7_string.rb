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
