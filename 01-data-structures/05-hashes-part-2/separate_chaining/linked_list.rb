require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    @tail ? @tail.next = node : @head = node
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    if current == @tail
      @head = nil
      @tail = nil
    else
      while current.next != nil
        if current.next = @tail
          @tail = current
          current.next = nil
        else
          current = current.next
        end
      end
    end
  end

  # This method prints out a representation of the list.
  def print
    @head = current
    while current != nil
      puts current.data
      current = current.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    if current == node
      remove_front
    elsif node == @tail
      remove_tail
    else
      while current.next != nil
        if current.next = node
          current.next = current.next.next
        else
          current = current.next
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head != nil
      first = @head
      node.next = first
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if @head == @tail
      @tail = nil
    end
    @head = @head.next
  end
end
