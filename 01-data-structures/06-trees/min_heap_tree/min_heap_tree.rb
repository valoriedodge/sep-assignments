require_relative 'node'
require_relative 'myqueue'
require_relative 'mystack'

class MinHeapTree
  attr_accessor :head

  def initialize
    @head = head
  end

  def insert(root, node)
    if @head == nil
      @head = node
      return
    end
    if @head == root && root.rating < node.rating
      temp = root
      @head = node
      @head.left = temp.left
      @head.right = temp.right
      node = temp
      insert(@head, node)
      return
    end
    current = root
    queue = MyQueue.new()
    queue.enqueue(current)
    while queue.empty?
      current = queue.dequeue
      if current.left && current.right
        if current.left.rating < node.rating
          temp = current.left
          current.left = node
          current.left.left = temp.left
          current.left.right = temp.right
          node = temp
          insert(root, node)
          return
        end
        if current.right.rating < node.rating
          temp = current.right
          current.right = node
          current.right.left = temp.left
          current.right.right = temp.right
          node = temp
          insert(root, node)
          return
        end
        queue.enqueue(current.left)
        queue.enqueue(current.right)
      elsif current.left
        current.right = node
        return
      else
        current.left = node
        return
      end
    end
  end

  def delete(root, node)
    
  end

  def find(root, node)
  end

  def printf(children=nil)
    @head == nil ? return : current = @head
    queue = MyQueue.new()
    queue.enqueue(@head)
    while queue.empty?
      current = queue.dequeue
      puts current.title + ": " + current.rating.to_s
      if current.left != nil
        queue.enqueue(current.left)
      end
      if current.right != nil
        queue.enqueue(current.right)
      end
    end
  end
end
