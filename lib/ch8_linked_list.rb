require "linked_list"

# 8.1 Merge two sorted list into one.
def merge_sorted_list(list1, list2)
  node1 = list1.first
  node2 = list2.first
  new_list = LinkedList.new
  while node1 != list1.tail && node2 != list2.tail
    if node1.val <= node2.val
      new_list.insert(node1.key, node1.val)
      node1 = node1.next
    else
      new_list.insert(node2.key, node2.val)
      node2 = node2.next
    end
  end

  while node1 != list1.tail
    p node1.key
    new_list.insert(node1.key, node1.val)
    node1 = node1.next
  end
  while node2 != list2.tail
    p node2.key
    new_list.insert(node2.key, node2.val)
    node2 = node2.next
  end
  new_list
end

# 8.2 Reverse a sublist
def reverse_sublist(list, start_idx, end_idx)
  new_list = LinkedList.new
  node = list.first
  count = 0
  last_node = nil

  # Dup the list
  while node != list.tail
    next_node = node.next
    new_list.add_link(node)
    node = next_node
  end
  node = new_list.first
  # Copy the first start_idx nodes to the new linkedlist
  while count < start_idx
    node = node.next
    count += 1
  end

  # Start to insert the next node to the end of the new linkedlist
  while count < end_idx
    temp_node =
    count += 1
  end

  while node != list.tail
    next_node = node.next
    new_list.add_link(node)
    last_node = node
    node = next_node
  end
  new_list
end

# 8.3  Find if a list has circle sub list

def circle(list)
  slow = list.first
  fast = list.first
  while fast != nil && fast.next != nil && fast.next.next != nil
    # if not finding the circle yet, advance slow by one, and fast by two.
    slow = slow.next
    fast = fast.next.next
    # find the circle, then find the start node of the circle
    if slow == fast
      slow = list.first
      while slow != fast
        slow = slow.next
        fast = fast.next
      end
      # after the loop, slow will be the first node of the circle list.
      return slow
    end
  end

  # No circle, return nil
  nil
end

# 8.4 Find overlapped List
def overlapping_lists(list1, list2)
  node1 = list1.first
  node2 = list2.first
  l1 = list_length(list1)
  l2 = list_length(list2)

  # Make sure the lists start with the same length
  if l1 > l2
    node1 = advanced_by_k(l1 - l2, node1)
  else
    node2 = advanced_by_k(l2 - l1, node2)
  end

  # Check if both lists has the same node (No Cycle)
  while node1 != list1.tail && node2 != list2.tail && node1 != node2
    node1 = node1.next
    node2 = node2.next
  end

  return nil if node1 = list1.tail
  node1
end

def list_length(list)
  node = list.first
  length = 0
  while node != list.tail
    length += 1
  end
  length
end

def advanced_by_k(k, node)
  count = 0
  while count < k
    node = node.next
  end
  node
end

# 8.6 Delete a node with O(n) time in a single-linked list - no need to loop through the list
def node_to_delete(node)
  # Instead of deleting a node, we copy the key/val from the next node and delete the next node;
  # assuming we cannot use prev in a single-linked list
  node.key = node.next.key
  node.val = node.next.val

  node.next = node.next.next
  node.next.prev = node
end

# 8.7 Delete kth last node from a list
# Use 2 intreators, one is k steps advanced than the other,
# when it reaches the tail, the other one is at (k + 1)th last node.
# O(n) time and O(1) space.
def delete_kth_last_node(list, k)
  first = list.first
  second = list.first
  count = 0
  while count < k
    first = first.next
  end
  while first != tail
    first = first.next
    second = second.next
  end
  second.next = second.next.next
  second.next.prev = second
  return list
end

# 8.8 cyclically right shifted kth node in a singly-linked list
# Find the length, and make a circle for the list
# then move the head (length - k) steps to the next
# O(n) time and O(1) space.
def cyclically_right_shift_list(list, k)
  length = 0
  tail = list.first
  while tail.next != list.tail
    length += 1
    tail = tail.next
  end

  k %= length
  # We have the last node and length now.
  new_tail = tail
  step_to_head = length - k
  while step_to_head > 0
    new_tail = new_tail.next
    step_to_head -= 1
  end

  new_head = new_tail.next
  new_head.prev = list.head
  list.head.next = new_head
  new_tail.next = list.tail
  list.tail.prev = new_tail
  list
end
