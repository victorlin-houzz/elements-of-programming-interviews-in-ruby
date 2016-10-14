require 'ch7_string'

describe "String interview questions" do
  describe "#int_to_str" do
    it "converts a number to string" do
      # p swap_even_odd(arr)
      expect(int_to_str(12345)).to eq("12345")
    end
  end

end
