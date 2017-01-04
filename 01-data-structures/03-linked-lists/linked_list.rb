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
    if @tail
      @tail.next = node
    else
      @head = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    first = @head
    if @head == @tail
      @head = nil
      @tail = nil
    else
      while @head.next != nil
        if @head.next == @tail
          @head.next = nil
          @tail = @head
        else
          @head = @head.next
        end
      end
      @head = first
    end
  end

  # This method prints out a representation of the list.
  def print
    first = @head
    list = ""
    while @head
      list += @head.data + "\n"
      @head = @head.next
    end
    p list
    @head = first
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    first = @head
    if @head == node
      @head = nil
      @tail = nil
    elsif @tail == node
      remove_tail
    else
      while @head.next != nil
        if @head.next == node
          @head.next = @head.next.next
        else
          @head = @head.next
        end
      end
      @head = first
    end

  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head
      first = @head
      @head = node
      @head.next = first
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
