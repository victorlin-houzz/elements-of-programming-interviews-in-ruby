require 'ch6_array'

describe "Array interview questions" do
  describe "#swap_even_odd" do
    it "swaps even number to the front of the array" do
      arr = [1,5,6,7,8,2,3]
      # p swap_even_odd(arr)
      expect(swap_even_odd(arr)).to eq([2,8,6,5,3,1,7])
    end
  end
  describe "#dutch_flag_partition" do
    it "swaps even number to the front of the array" do
      arr = [8,2,9,7,6,1,3]
      # p swap_even_odd(arr)
      expect(dutch_flag_partition(arr, 3)).to eq([2,8,6,5,3,1,7])
    end
  end
end
