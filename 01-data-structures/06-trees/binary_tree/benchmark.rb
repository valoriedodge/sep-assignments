require 'benchmark'
require_relative 'binary_search_tree'
require_relative 'min_heap_tree'
require_relative 'node'

nodeArr = []
root = Node.new("500", 500)
binary_tree = BinarySearchTree.new(root)
heap_tree = MinHeapTree.new
(0..1000).each do |num|
  node = Node.new(num.to_s, num)
  nodeArr[num] = node
end

def insert_values(nodeArr)
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new

  Benchmark.bmbm do |x|
    x.report("100,000 Binary") {
      nodeArr.each do |node|
        binary_tree.insert(root, node)
      end
    }
    x.report("100,000 Heap") {
      nodeArr.each do |node|
        heap_tree.insert(node)
      end
    }
  end

end

def find_middle
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 5,000th Binary") {
      1000.times do
        binary_tree.find(root, "490")
      end
    }
    x.report("Find 5,000th Heap") {
      1000.times do
        heap_tree.find("490")
      end
    }
  end

end

def find_value_middle
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 5,000th Binary") {
      10.times do
        binary_tree.find_value(root, 490)
      end
    }
    x.report("Find 5,000th Heap") {
      10.times do
        heap_tree.find_value(490)
      end
    }
  end

end

def find_beginning
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 1st Binary") {
      10.times do
        binary_tree.find(root, "1")
      end
    }
    x.report("Find 1st Heap") {
      10.times do
        heap_tree.find("1")
      end
    }
  end

end

def find_value_beginning
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 1st Binary Number") {
      10.times do
        binary_tree.find_value(root, 1)
      end
    }
    x.report("Find 1st Heap Number") {
      10.times do
        heap_tree.find_value(1)
      end
    }
  end

end
def find_end
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 100,000th Binary") {
      10.times do
        binary_tree.find(root, "1000")
      end
    }
    x.report("Find 100,000th Heap") {
      10.times do
        heap_tree.find("1000")
      end
    }
  end

end

def find_value_end
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bmbm do |x|
    x.report("Find 100,000th Binary Number") {
      10.times do
        binary_tree.find_value(root, 1000)
      end
    }
    x.report("Find 100,000th Heap Number") {
      10.times do
        heap_tree.find_value(1000)
      end
    }
  end
end

def delete_middle
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bm do |x|
    x.report("delete 5,000th Binary") {
      binary_tree.delete(root, "490")
    }
    x.report("delete 5,000th Heap") {
      heap_tree.delete("490")
    }
  end

end

def delete_beginning
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bm do |x|
    x.report("delete 1st Binary") {
      binary_tree.delete(root, "1")
    }
    x.report("delete 1st Heap") {
      heap_tree.delete("1")
    }
  end

end

def delete_end
  root = Node.new("500", 500)
  binary_tree = BinarySearchTree.new(root)
  heap_tree = MinHeapTree.new
  (0..1000).each do |num|
    node = Node.new(num.to_s, num)
    binary_tree.insert(root, node)
    heap_tree.insert(node)
  end

  Benchmark.bm do |x|
    x.report("delete 100,000th Binary") {
      binary_tree.delete(root, "1000")
    }
    x.report("delete 100,000th Heap") {
      heap_tree.delete("1000")
    }
  end
end

insert_values(nodeArr)
find_middle
find_value_middle
find_beginning
find_value_beginning
find_end
find_value_end
delete_middle
delete_beginning
delete_end
