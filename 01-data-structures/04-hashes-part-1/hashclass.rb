require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    key_index = index(key, @items.length)
    if @items[key_index] != nil
      puts "value: " + @items[key_index].value + " end"
      if @items[key_index].value != value
        resize
        # I want to recursively call this function but I don't know how.
        # @items[key]= value)
      end
    else
      @items[key_index] = HashItem.new(key, value)
    end
  end

  def [](key)
    key_index = index(key, @items.length)
    puts "[](key) " + @items[key_index]
    @items[key_index]
  end

  def resize
    newSize = size * 2
    tempArray = Array.new(newSize)
    @items[newSize - 1] = nil
    @items.each do |element|
      if element != nil
        newIndex = index(element.key, newSize)
        if tempArray[newIndex] != nil
          resize
          return
        else
          tempArray[newIndex]= element.value
        end
      end
    end
    @items = tempArray
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    asciiArray = key.bytes
    answer = asciiArray.join("").to_i % size
    return answer
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
