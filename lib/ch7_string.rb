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

#
