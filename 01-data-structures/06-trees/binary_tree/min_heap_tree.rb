require_relative 'node'

class MinHeapTree
  attr_accessor :tree

  def initialize
    @tree = []
  end

  def insert(node)
    if @tree.length < 2
      @tree[1] = node
      return
    end
    index = @tree.length
    @tree[index] = node
    rotate_up(index)
  end

  def find(data)
    return nil if data.nil?
    @tree.each { |node| return node if node && node.title == data }
    return nil
  end

  def find_value(data)
    return nil if data.nil?
    @tree.each { |node| return node if node && node.rating == data }
    return nil
  end

  def delete(data)
    return nil if data.nil?
    @tree.map.with_index do |node, x|
      if node && node.title == data
        if x == @tree.length - 1
          @tree.pop
          return
        end
        last = @tree.pop
        @tree[x] = last
        parent = x/2
        if @tree[parent] && @tree[x].rating < @tree[parent].rating
          rotate_up(x)
        else
          rotate_down(x)
        end
        return
      end
    end
  end

  def rotate_up(index)
    parent = index/2
    while (parent > 0)
      if @tree[index].rating < @tree[parent].rating
        temp = @tree[index]
        @tree[index] = @tree[parent]
        @tree[parent] = temp
      else
        return
      end
      index = parent
      parent = index/2
    end
  end

  def rotate_down(index)
    while (@tree[index*2] != nil)
      child1 = index*2
      child2 = (index*2) + 1
      if @tree[child2] != nil
        if @tree[index].rating < @tree[child1].rating && @tree[index].rating < @tree[child2].rating
          return
        end
        if @tree[child1].rating < @tree[child2].rating
          swap(index, child1)
          index = child1
        else
          swap(index, child2)
          index = child2
        end
      else
        if @tree[index].rating < @tree[child1].rating
          return
        else
          swap(index, child1)
          index = child1
        end
      end
    end
  end

  def print
    @tree.each do |node|
      if node != nil
        puts node.title + ": " + node.rating.to_s
      end
    end
  end

  def swap(index1, index2)
    temp = @tree[index1]
    @tree[index1] = @tree[index2]
    @tree[index2] = temp
  end




#   def insert(root, node)
#     if @head == nil
#       @head = node
#       return
#     end
#     if @head == root && root.rating > node.rating
#       temp = root
#       @head = node
#       @head.left = temp.left
#       @head.right = temp.right
#       node = temp
#       insert(@head, node)
#       return
#     end
#     current = root
#     queue = MyQueue.new()
#     queue.enqueue(current)
#     while queue.empty?
#       current = queue.dequeue
#       if current.left && current.right
#         if current.left.rating > node.rating
#           temp = current.left
#           current.left = node
#           current.left.left = temp.left
#           current.left.right = temp.right
#           node = temp
#           insert(root, node)
#           return
#         end
#         if current.right.rating > node.rating
#           temp = current.right
#           current.right = node
#           current.right.left = temp.left
#           current.right.right = temp.right
#           node = temp
#           insert(root, node)
#           return
#         end
#         queue.enqueue(current.left)
#         queue.enqueue(current.right)
#       elsif current.left
#         current.right = node
#         return
#       else
#         current.left = node
#         return
#       end
#     end
#   end
#
#   def delete(root, node)
#     return nil if data.nil?
#     # If we are deleting the root we need to reassign @head
#     if @head == root && root.title == data
#       if root.left && root.right
#         if root.right.rating < root.left.rating
#           right_root = root.right
#           @head = delete_min_node(root.right)
#           @head.right = right_root
#         else
#           @head = root.right
#         end
#         return
#       elsif root.right
#         @head = root.right
#         return
#       elsif root.left
#         @head = root.left
#         return
#       else
#         @head = nil
#         return
#       end
#     end
#     parent = root if root.right && root.right.title == data
#     parent = root if root.left && root.left.title == data
#     if parent
#       if parent.right && parent.right.title == data
#         delete_right(parent, parent.right)
#       end
#       if parent.left && parent.left.title == data
#         delete_left(parent, parent.left)
#       end
#     end
#     parent = delete(root.right, data) if root.right && parent.nil?
#     parent = delete(root.left, data) if root.left && parent.nil?
#     parent ? parent : nil
#   end
#
#   def find(root, node)
#     return nil if data.nil?
#     return root if root && root.title == data
#     found = find(root.right, data) if root.right
#     found = find(root.left, data) if root.left && found.nil?
#     found ? found : nil
#   end
#
#   def printf(children=nil)
#     @head == nil ? return : current = @head
#     queue = MyQueue.new()
#     queue.enqueue(@head)
#     while queue.empty?
#       current = queue.dequeue
#       puts current.title + ": " + current.rating.to_s
#       if current.left != nil
#         queue.enqueue(current.left)
#       end
#       if current.right != nil
#         queue.enqueue(current.right)
#       end
#     end
#   end
#
#   def rotate_right(parent, node)
#     if node.left && node.right
#       if node.left.rating < node.right.rating
#         parent.left
#     end
#   end
end
