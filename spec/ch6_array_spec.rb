require 'ch6_array'

describe "Array interview questions" do
  describe "#swap_even_odd" do
    it "swaps even number to the front of the array" do
      arr = [1,5,6,7,8,2,3]
      # p swap_even_odd(arr)
      expect(swap_even_odd(arr)).to eq([2, 8, 6, 7, 5, 3, 1])
    end
  end
  describe "#dutch_flag_partition" do
    it "partitions an array into 3 sections" do
      arr = [8,2,9,7,6,1,3]

      expect(dutch_flag_partition(arr, 3)).to eq([3, 2, 1, 6, 7, 9, 8])
    end
  end

  describe "#stock_max_profit" do
    it "calculates the maximum profit for a stock" do
      arr = [15,5,10,20,5,65,0,30,15,75,20]

      expect(stock_max_profit(arr)).to eq([6,9])
    end
  end

  describe "#random_subset" do
    it "returns a random subset of an array" do
      arr = [1,2,3,4,5]

      expect(random_subset(arr, 3)).not_to eq([1,2,3])
    end
  end

  describe "#matrix_spiral" do
    it "returns an array with spiral order of a 2D array" do
      arr = [[1,2,3],[4,5,6],[7,8,9 ]]

      expect(matrix_spiral(arr)).to eq([1,2,3,6,9,8,7,4,5])
    end
  end

  describe "#rotate_matrix" do
    it "returns an array with clockwise/counter-clockwise order of a 2D array" do
      arr = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
      out_arr1 = [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]]
      out_arr2 = [[4,8,12,16],[3,7,11,15],[2,6,10,14],[1,5,9,13]]

      expect(rotate_matrix(arr, true)).to eq(out_arr1)
      expect(rotate_matrix(arr, false)).to eq(out_arr2)
    end
  end
  describe "#pascal_triangle" do
    it "returns a pascal triangle array" do
      arr2 = [[1], [1,1]]
      arr3 = [[1], [1,1], [1,2,1]]
      arr4 = [[1], [1,1], [1,2,1], [1,3,3,1]]
      arr5 = [[1], [1,1], [1,2,1], [1,3,3,1], [1,4,6,4,1]]

      expect(pascal_triangle(2)).to eq(arr2)
      expect(pascal_triangle(3)).to eq(arr3)
      expect(pascal_triangle(4)).to eq(arr4)
      expect(pascal_triangle(5)).to eq(arr5)

    end
  end
end
