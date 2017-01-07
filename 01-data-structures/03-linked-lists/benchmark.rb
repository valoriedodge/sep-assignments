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

Benchmark.bm do |x|
  x.report("10,000 Array") {
    (0..n).each do |num|
      arr[num] = num
    end
  }
  x.report("10,000 LList") {
    nodeArr.each do |node|
      llist.add_to_tail(node)
    end
  }
  x.report("5,000th Array") {
    arr[5000]
  }
  x.report("5,000th LList") {
    current = llist.head
    5000.times do |i|
      current = current.next
    end
  }
  x.report("Delete 5,000th") {
    arr.delete_at(5000)
  }
  x.report("Delete 5,000th") {
    current = llist.head
    previous = nil
    5000.times do |i|
      previous = current
      current = current.next
    end
    previous.next = current.next
  }
end
