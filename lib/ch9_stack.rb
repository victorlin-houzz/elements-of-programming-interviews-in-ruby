def rpn_calc(rpn_exp)
  # "1,2,-,5,*"
  stack_arr = []
  rpn_arr = rpn_exp.split(',')
  rpn_arr.each do |el|
    if el.match(/[\+\-\*\/]/)
      b = stack_arr.pop
      a = stack_arr.pop
      result = 0
      case el
      when "+"
        result = a + b
      when "-"
        result = a - b
      when "*"
        result = a * b
      when "/"
        result = a / b
      end
      stack_arr.push(result)
    else
      stack_arr.push(el.to_i)
    end
  end
  stack_arr.last
end

def is_well_formed?(exp)
  return true unless exp =~ /[\(\)\{\}\[\]]/
  left_chars = []
  exp.each_char do |c|
    if c =~ /[\(\{\[]/
      left_chars.push(c)
    elsif c =~/[\)\}\]]/
      if c == ")" && left_chars.last != "(" ||
        c == "]" && left_chars.last != "[" ||
        c == "}" && left_chars.last != "{"
        return false
      else
        left_chars.pop
      end
    end
  end
  left_chars.empty?
end

class BTreeNode

  def initialize(value)
    @data = value
    @right = nil
    @left = nil
  end

  def add_right(value)
    right = BTreeNode.new(value)
    @right = right
  end

  def add_left(value)
    left = BTreeNode.new(value)
    @left = left
  end

  attr_accessor :data, :left, :right
end


def b_tree_depth_order(root)
  order_queue = [root]
  one_level = []
  out_arr = []
  curr_count = order_queue.length

  until order_queue.empty?
    curr_node = order_queue.shift
    one_level.push(curr_node.data)
    curr_count -= 1
    order_queue.push(curr_node.left) if curr_node.left != nil
    order_queue.push(curr_node.right) if curr_node.right != nil
    if curr_count == 0
      out_arr.push(one_level)
      one_level = []
      curr_count = order_queue.length
    end
  end
  out_arr

end
