# 18.1 Assign pair tasks to compute an optimum assignment of tasks
# arr = [5,2,1,6,4,4]
# Time: O(nlogn)
def assign_tasks(arr)
  result = []
  # Sort the work hours!
  arr.sort!
  0.upto(arr.length / 2 - 1).each do |idx|
    result << [arr[idx], arr[arr.length - 1 - idx]]
  end
  result
end

# 18.3 Find the minimum sized set of numbers that covers all the intervals
# intervals = [[3,4],[1,2],[4,5],[2,3],[6,7],[2,3]]
# Time: O(nlogn)
def min_set_of_intervals(intervals)
  intervals.sort!
  # Get the right point from the first set
  result = [intervals[0][1]]
  1.upto(intervals.length - 1).each do |idx|
    # The current right endpoint will not cover any more intervals
    if intervals[idx][0] > result.last
      result << intervals[idx][1]
    end
  end
  result
end
