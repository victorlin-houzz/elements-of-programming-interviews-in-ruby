require 'ch7_string'

describe "String interview questions" do
  describe "#int_to_str" do
    it "converts a number to string" do
      expect(int_to_str(12345)).to eq("12345")
      expect(int_to_str(-12345)).to eq("-12345")
    end
  end

  describe "#str_to_int" do
    it "converts a string to number" do
      expect(str_to_int("12345")).to eq(12345)
      expect(str_to_int("-12345")).to eq(-12345)
    end
  end

  describe "#is_palindrome" do
    it "checks if a string is a palindrome" do
      expect(is_palindrome("abccba")).to be_truthy
      expect(is_palindrome("abCcba")).to be_truthy
      expect(is_palindrome("abcba")).to be_truthy
      expect(is_palindrome("abcd eba")).to be_falsey
      expect(is_palindrome("A man, a plan, a canal, Panama.")).to be_truthy
    end
  end

  describe "#reverse_words" do
    it "reverses the word order in a sentence." do
      expect(reverse_words("Victor likes Joanne")).to eq("Joanne likes Victor")
    end
  end

  describe "#look_and_say" do
    it "reverses the word order in a sentence." do
      expect(look_and_say(1)).to eq("11")
      expect(look_and_say(2)).to eq("21")
      expect(look_and_say(3)).to eq("1211")
      expect(look_and_say(4)).to eq("111221")
    end
  end

  describe "#roman_to_dec" do
    it "converts the roman word to decimal number." do
      expect(roman_to_dec('IC')).to eq(99)
      expect(roman_to_dec('XVI')).to eq(16)
      expect(roman_to_dec('LIC')).to eq(149)
    end
  end
end
