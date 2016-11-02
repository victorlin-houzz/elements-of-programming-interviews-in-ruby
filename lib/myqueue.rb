class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :store
  def initialize
    @store = []
    @max_stack = []
    @min_stack = []
    @max = nil
    @min = nil
  end

  def max
    @max
  end

  def min
    @min
  end

  def pop
    popped = @store.pop
    if popped == @max
      @max_stack.pop
      @max = @max_stack.last
    end

    if popped == @min
      @min_stack.pop
      @min = @min_stack.last
    end
    popped
  end

  def push(el)
    @store << el
    if @max.nil? || el > @max
      @max = el
      @max_stack << el
    end

    if @min.nil? || el < @min
      @min = el
      @min_stack << el
    end
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue
  attr_reader :my_stack
  def initialize
    @my_stack = MyStack.new
    @temp_stack = MyStack.new
  end

  def max
    @my_stack.max
  end

  def min
    @my_stack.min
  end

  def enqueue(el)
    @my_stack.push(el)
  end

  def dequeue
    until @my_stack.empty?
      @temp_stack.push(@my_stack.pop)
    end
    return_el = @temp_stack.pop # dequeue!!!!

    until @temp_stack.empty?
      @my_stack.push(@temp_stack.pop)
    end
    return_el
  end

  def size
    @my_stack.size
  end

  def empty?
    @my_stack.empty?
  end
end

class StackQueue

  def initialize
    @my_stack = MyStack.new
    @temp_stack = MyStack.new
  end

  def enqueue(el)
    @my_stack.push(el)
  end

  def dequeue
    until @my_stack.empty?
      @temp_stack.push(@my_stack.pop)
    end
    return_el = @temp_stack.pop # dequeue!!!!

    until @temp_stack.empty?
      @my_stack.push(@temp_stack.pop)
    end
    return_el
  end

  def size
    @my_stack.size
  end

  def empty?
    @my_stack.empty?
  end
end
