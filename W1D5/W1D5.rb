class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

class Map

  def initialize
    @map = []
  end

  def [](idx)
    @map[idx]
  end

  def assign(key, value)
    if self.key?(key)
      @map[key_idx(key)][1] = value
    else
      @map << [key, value]
    end
  end

  def key_idx(key)
    @map.each_with_index do |arr, idx|
      return idx if arr.include?(key)
    end
  end

  def key?(key)
    @map.each do |arr|
      return true if arr.include?(key)
    end
    false
  end

  def lookup(key)
    @map[key_idx(key)].last
  end

  def remove(key)
    @map.delete_at(key_idx(key))
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end
