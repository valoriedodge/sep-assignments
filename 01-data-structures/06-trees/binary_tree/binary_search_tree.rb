require_relative 'node'
require_relative 'myqueue'
require_relative 'mystack'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    return if root == node
    if node.rating < root.rating
      if root.left.nil?
        root.left = node
        return
      else
        root = root.left
      end
    elsif node.rating >= root.rating
      if root.right.nil?
        root.right = node
        return
      else
        root = root.right
      end
    end
    insert(root, node)
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?
    return root if root && root.title == data
    found = find(root.right, data) if root.right
    found = find(root.left, data) if root.left && found.nil?
    found ? found : nil
  end

  def find_value(root, data)
    return nil if data.nil?
    return root if root && root.rating == data
    if root && root.rating < data
      found = find_value(root.right, data) if root.right
    elsif root && root.rating >= data
      found = find_value(root.left, data) if root.left
    end
    found ? found : nil
  end

  def delete(root, data)
    return nil if data.nil?
    # If we are deleting the root we need to reassign @root
    if @root == root && root.title == data
      if root.left && root.right
        left_root = root.left
        if root.right.left
          right_root = root.right
          @root = delete_min_node(root.right)
          @root.right = right_root
        else
          @root = root.right
        end
        @root.left = left_root
        return
      elsif root.right
        @root = root.right
        return
      elsif root.left
        @root = root.left
        return
      else
        @root = nil
        return
      end
    end
    parent = root if root.right && root.right.title == data
    parent = root if root.left && root.left.title == data
    if parent
      if parent.right && parent.right.title == data
        delete_right(parent, parent.right)
      end
      if parent.left && parent.left.title == data
        delete_left(parent, parent.left)
      end
    end
    parent = delete(root.right, data) if root.right && parent.nil?
    parent = delete(root.left, data) if root.left && parent.nil?
    parent ? parent : nil

  end

  # Recursive Breadth First Search
  def printf(children=nil)
    @root == nil ? return : current = @root
    queue = MyQueue.new()
    queue.enqueue(@root)
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

  def rotate(parent, current, previous_left)
    return if previous_left.nil?
    if current.right.nil? && current.left
      temp = current
      parent.right = current.left
      rotate(parent, parent.right, previous_left)
      insert(@root, temp)
    else
      child_left = current.left
      current.left = previous_left
      if child_left
        rotate(current, current.right, child_left)
      end
    end
  end

  def delete_left(parent, node)
    if node.left && node.right
      left_node = node.left
      if node.right.left
        right_node = node.right
        parent.left = delete_min_node(node.right)
        parent.left.right = right_node
      else
        parent.left = node.right
      end
      parent.left.left = left_node
      return
    elsif node.right
      parent.left = node.right
      return
    elsif node.left
      parent.left = node.left
      return
    else
      parent.left = nil
      return
    end
  end

  def delete_right(parent, node)
    if node.left && node.right
      left_node = node.left
      if node.right.left
        right_node = node.right
        parent.right = delete_min_node(node.right)
        parent.right.right = right_node
      else
        parent.right = node.right
      end
      parent.right.left = left_node
      return
    elsif node.right
      parent.right = node.right
      return
    elsif node.left
      parent.right = node.left
      return
    else
      parent.right = nil
      return
    end
  end

  def delete_min_node(node)
    if node.left
      if node.left.left.nil?
        target = node.left
        node.left = nil
        return target
      else
        delete_min_node(node.left)
      end
    end
  end

end
