require 'ch8_linked_list'
require 'linked_list'

describe "Linked List Interview questions" do

  list = LinkedList.new
  list.insert(1,1)
  list.insert(2,2)
  list.insert(3,3)
  list.insert(5,5)
  list.insert(7,7)
  list.insert(8,8)
  list.insert(10,10)
  list.insert(11,11)
  list.insert(12,12)
  list.insert(13,13)
  list.insert(18,18)
  list.insert(19,19)
  list.insert(21,21)
  list.insert(22,22)
  list.insert(32,32)
  list.insert(33,33)

  describe "Merge 2 sorted List" do
    list1 = LinkedList.new
    list2 = LinkedList.new
    list1.insert(1,1)
    list2.insert(2,2)
    list1.insert(3,3)
    list2.insert(5,5)
    list2.insert(7,7)
    list1.insert(8,8)
    list2.insert(10,10)
    list1.insert(11,11)
    list1.insert(12,12)
    list1.insert(13,13)
    list1.insert(18,18)
    list2.insert(19,19)
    list1.insert(21,21)
    list1.insert(22,22)
    list2.insert(32,32)
    list1.insert(33,33)

    # it "checks if 2 sorted list are merged into one list" do
    #   expect(merge_sorted_list(list1, list2)).to eq(list3)
    # end
  end

  describe "#reverse_sublist" do
    it "checks if it reverse a sublist of a list" do
      new_list = reverse_sublist(list, 3, 6)
      new_list.each do |el|
        p el.val
      end
    end
  end

end
