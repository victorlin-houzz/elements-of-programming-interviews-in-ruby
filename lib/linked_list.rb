class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    link = @head
    while link != @tail
      return link.val if link.key == key
      link = link.next
    end
    nil
  end

  def include?(key)
    return true unless get(key).nil?
    false
  end

  def add_link(new_link)
    last = @tail.prev
    last.next = new_link
    new_link.prev = last
    new_link.next = @tail
    @tail.prev = new_link
  end
  def insert(key, val)
    new_link = Link.new(key,val)
    last = @tail.prev
    last.next = new_link
    new_link.prev = last
    new_link.next = @tail
    @tail.prev = new_link
  end

  def remove(key)
    if include?(key)
      link = @head
      while link != @tail
        if link.key == key
          break
        end
        link = link.next
      end
      unless link == @tail
        last_link = link.prev
        next_link = link.next
        last_link.next = next_link
        next_link.prev = last_link
      end
    end
    nil
  end

  def each
    link = @head.next
    while link != @tail
      proc.call(link)
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
