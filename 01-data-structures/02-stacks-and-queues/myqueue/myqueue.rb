class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue.last
    @tail = @queue[0]
  end

  def dequeue
    @queue.shift
    @head = @queue[@queue.length - 1]
    @tail = @queue[0]
  end

  def empty?
    @queue.length > 0
  end
end
