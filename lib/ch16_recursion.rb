# 15.1 Tower of Hanoi
def compute_tower_of_hanoi(nums)
  # Setup
  num_pegs = 4
  pegs = []
  num_pegs.times do |time|
    pegs << []
  end
  (nums - 1).downto(0).each do |num|
    pegs[0] << num
  end
  p pegs
  compute_toh(nums, pegs, 0,1,2)
end

def compute_toh(nums, pegs, from, to, via)
  if nums > 0
    compute_toh(nums - 1, pegs, from, via, to)
    pegs[to] << pegs[from].pop
    p 'moving from peg ' + from.to_s + ' to peg ' + to.to_s + ' --- Disk ' + pegs[to].last.to_s
    compute_toh(nums - 1, pegs, via, to, from)
  end
end
