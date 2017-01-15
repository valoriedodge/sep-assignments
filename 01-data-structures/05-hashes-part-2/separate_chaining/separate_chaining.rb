require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size){LinkedList.new}
  end

  def []=(key, value)
    key_index = index(key, size)
    current = @items[key_index].head
    while current != nil
      if current.key == key
        current.value = value
        return
      else
        current = current.next
      end
    end
    @items[key_index].add_to_front(Node.new(key, value))
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    key_index = index(key, size)
    current = @items[key_index].head
    while current != nil
      if current.key == key
        return current.value
      else
        current = current.next
      end
    end
    return nil
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    itemCount = 0
    @items.each do |llist|
      current = llist.head
      while current != nil
        itemCount += 1
        current = current.next
      end
    end
    return itemCount / size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    newSize = size * 2
    tempArray = Array.new(newSize){LinkedList.new}
    @items.each do |llist|
      current = llist.head
      while current != nil
        newIndex = index(current.key, newSize)
        tempArray[newIndex].add_to_front(Node.new(current.key, current.value))
        current = current.next
      end
    end
    @items = tempArray
  end

  def printMe
    puts "Items length #{size}"
    @items.each_with_index do |llist, index|
      current = llist.head
      puts "LList at #{index}"
      while current != nil
        puts "Items key #{current.key}"
        puts "Items value #{current.value}"
        current = current.next
      end
    end
  end

end
