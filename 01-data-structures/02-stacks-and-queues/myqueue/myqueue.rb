class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue.last
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue.last
    @tail = @queue[0]
  end

  def dequeue
    temp = @queue.shift
  end

  def empty?
    if @queue.length > 0
      false
    else
      true
    end
  end
end
