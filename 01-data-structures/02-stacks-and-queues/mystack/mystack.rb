class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack[@stack.length] = item
    self.top = item
  end

  def pop
    temp = self.top
    @stack.delete(temp)
    len = @stack.length - 1
    self.top = @stack[len]
    temp
  end

  def empty?
    if @stack.length > 0
      false
    else
      true
    end
  end
end
