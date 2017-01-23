require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    key_index = index(key, size)
    #if @items does not have anything at key_index insert new node
    if @items[key_index] == nil
      @items[key_index]= Node.new(key, value)
      return
    end
    #check to see if the given key exists already
    if @items[key_index].key == key
      #if key and value are already at the given index do nothing
      if @items[key_index].value == value
        return
      #otherwise assign the new value to the key
      else
        @items[key_index].value = value
        return
      end
    end
    #if calculated index is not empty and does not equal the given key, find next open index
    if @items[key_index].key != key
      key_index = next_open_index(key_index)
    end
    #if key_index is -1, resize until key_index is not -1
    while key_index == -1
      resize
      key_index = index(key, size)
      #Check to see if key_index is empty in the array, if not, find the next open index
      if @items[key_index] != nil
        key_index = next_open_index(key_index)
      end
    end
    #Insert item at the new key_index
    @items[key_index]= Node.new(key, value)
  end

  def [](key)
    key_index = index(key, size)
    if @items[key_index].key == key
      return @items[key_index].value
    else
      current = key_index + 1
      #use while loop to loop through entire array, until we find key or return to the original key_index
      while current != key_index
        if @items[current] != nil && @items[current].key == key
          return @items[current].value
        else
          #increment current to loop through the entire array
          current = (current + 1) % size
        end
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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    current = index
    #if @items has only one item, return -1
    if size == 1
      return -1
    end
    current += 1
    while current != index
      if @items[current] == nil
        return current
      else
        current = (current + 1) % size
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  def printMe
    puts "Items length #{size}"
    @items.each_with_index do |element, index|
      if element != nil
        puts "Items key #{index}"
        puts "Items key #{element.key}"
        puts "Items value #{element.value}"
      end
    end
  end

  # Resize the hash
  def resize
    newSize = size * 2
    collisionCheck = true
    while collisionCheck
      tempArray = Array.new(newSize)
      #for loop to reasign every element in @items to tempArray
      for i in 0..size-1
        element = @items[i]
        if element != nil
          newIndex = index(element.key, newSize)
          #if there is a collision in tempArray, double the size and break for loop
          if tempArray[newIndex] != nil
            newSize = newSize * 2
            break
          else
            tempArray[newIndex] = element
          end
        end
        #check to see if it made it through the entire array, if so end while loop with collisionCheck
        if i == size-1
          collisionCheck = false
        end
      end
    end
    @items = tempArray
  end
end
