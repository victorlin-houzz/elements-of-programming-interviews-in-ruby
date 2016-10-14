def int_to_str(num)
  is_negative = num < 0
  out_str = is_negative ? "-" : ""
  in_num = num.abs
  while in_num > 0
    out_str = ('0'.ord + in_num % 10).chr + out_str
    in_num /= 10
  end
  out_str
end

def string_to_int(str)

end
