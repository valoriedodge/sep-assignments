require_relative 'node'
require_relative 'myqueue'
require_relative 'mystack'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current = root
    # finished = false
    # while finished != true
    if node.rating < current.rating
      if current.left == nil
        current.left = node
        # finished = true
        return
      else
        current = current.left
      end
    elsif node.rating >= current.rating
      if current.right == nil
        current.right = node
        # finished = true
        return
      else
        current = current.right
      end
    end
    insert(current, node)
    # end

  end

  # Recursive Depth First Search
  def find(root, data)
    current = root
    if data == nil
      return nil
    end
    stack = MyStack.new()
    while current != nil
      if current.title == data
        return current
      else
        if current.right != nil
          if current.left != nil
            stack.push(current.left)
          end
          current = current.right
        elsif current.left != nil
          current = current.left
        elsif stack.empty? != true
          current = stack.pop
        else
          current = nil
        end
      end
    end
  end

  def delete(root, data)
    current = root
    if data == nil
      return nil
    end
    stack = MyStack.new()
    while current != nil
      if @root.title == data
        @root = @root.right
      elsif current.right != nil && current.right.title == data
        previous_left = nil
        if current.right.left != nil
          previous_left = current.right.left
        end
        current.right = current.right.right
        current = current.right
        # previous.right = current.right
        # temp = current.left
        while previous_left != nil
          if current.left != nil
              left_node = current.left
              current.left = previous_left
              if current.right != nil
                current = current.right
                previous_left = left_node
              else
              end
          elsif current.left == nil
            current.left = previous.left
            previous_left == nil
          end
        end
        if

      elsif current.left != nil && current.left.title == data
        previous = current
        current = current.left
        previous.right = current
        if current.right != nil
          while current.right != nil
            left_node = current.left
            current = current.right
            current.left = left_node
          end
        end
        # Call recursively until we find the value to delete
      else
        if current.right != nil
          if current.left != nil
            stack.push(current.left)
          end
          current = current.right
        elsif current.left != nil
          current = current.left
        elsif stack.empty? != true
          current = stack.pop
        else
          current = nil
        end
      end
    end

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    @root == nil ? return : current = @root
    current = @root
    queue = MyQueue.new()
    if current != nil
      puts current.title + ": " + current.rating.to_s
      if current.left != nil
        puts current.left.title + ": " + current.left.rating.to_s
        queue.enqueue(current.left)
      end
      if current.right != nil
        puts current.right.title + ": " + current.right.rating.to_s
        queue.enqueue(current.right)
      end
    end
    while queue.empty?
      current = queue.dequeue
      if current.left != nil
        puts current.left.title + ": " + current.left.rating.to_s
        queue.enqueue(current.left)
      end
      if current.right != nil
        puts current.right.title + ": " + current.right.rating.to_s
        queue.enqueue(current.right)
      end
    end
  end
end
