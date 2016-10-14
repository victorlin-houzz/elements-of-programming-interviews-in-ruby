require 'ch7_string'

describe "String interview questions" do
  describe "#int_to_str" do
    it "converts a number to string" do
      # p swap_even_odd(arr)
      expect(int_to_str(12345)).to eq("12345")
      expect(int_to_str(-12345)).to eq("-12345")
    end
  end

  describe "#str_to_int" do
    it "converts a string to number" do
      # p swap_even_odd(arr)
      expect(str_to_int("12345")).to eq(12345)
      expect(str_to_int("-12345")).to eq(-12345)
    end
  end

  describe "#is_palindrome" do
    it "checks if a string is a palindrome" do
      # p swap_even_odd(arr)
      expect(is_palindrome("abccba")).to be_truthy
      expect(is_palindrome("abCcba")).to be_truthy
      expect(is_palindrome("abcba")).to be_truthy
      expect(is_palindrome("abcd eba")).to be_falsey
      expect(is_palindrome("A man, a plan, a canal, Panama.")).to be_truthy

    end
  end

end
