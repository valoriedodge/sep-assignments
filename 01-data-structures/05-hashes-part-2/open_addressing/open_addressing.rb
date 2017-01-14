require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    key_index = index(key, size)
    if @items[key_index] != nil && @items[key_index].key == key && @items[key_index].value == value
      return
    end

    while @items[key_index] != nil && @items[key_index].key != key
      resize
      key_index = index(key, size)
    end
    @items[key_index]= Node.new(key, value)
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    current = index
    while @items[current] != nil && current < size
      current += 1
    end
    current >= size ? nil : current
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
  end
end
