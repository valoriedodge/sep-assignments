require_relative 'hash_item'

class HashClass

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
    if @items[key_index] != nil && @items[key_index].key == key
      @items[key_index].value = value
    else
      @items[key_index]= HashItem.new(key, value)
    end
  end

  def [](key)
    key_index = index(key, size)
    @items[key_index].value
  end

  def resize
    newSize = size * 2
    tempArray = Array.new(newSize)
    @items.each do |element|
      if element != nil
        newIndex = index(element.key, newSize)
        if tempArray[newIndex] != nil
          @items[newSize - 1] = nil
          resize
          return
        else
          tempArray[newIndex] = element
        end
      end
    end
    @items = tempArray
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
