require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
arr = []
nodeArr = []
llist = LinkedList.new
(0..n).each do |num|
  node = Node.new(num)
  nodeArr[num] = node
end

Benchmark.bmbm do |x|
  x.report("10,000 Array") {
    100.times do
      (0..n).each do |num|
        arr[num] = num
      end
    end
  }
  x.report("10,000 LList") {
    100.times do
      nodeArr.each do |node|
        llist.add_to_tail(node)
      end
    end
  }
  x.report("5,000th Array") {
    1000.times do
      arr[5000]
    end
  }
  x.report("5,000th LList") {
    1000.times do
      current = llist.head
      5000.times do |i|
        current = current.next
      end
    end
  }
  x.report("Delete 5,000th") {
    10.times do
      arr.delete_at(5000)
    end
  }
  x.report("Delete 5,000th") {
    10.times do
      current = llist.head
      previous = nil
      5000.times do |i|
        previous = current
        current = current.next
      end
      previous.next = current.next
    end
  }
end
