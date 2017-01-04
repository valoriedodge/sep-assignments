require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000
arr = []
llist = LinkedList.new

Benchmark.bm do |x|
  x.report("10,000 Array") {
    (0..n).each do |num|
      arr[num] = num
    end
  }
  x.report("10,000 LList") {
    (0..n).each do |num|
      num = Node.new(num)
      llist.add_to_tail(num)
    end
  }
  x.report("5,000th Array") {
    arr[5000]
  }
  x.report("5,000th LList") {
    current = llist.head
    while current.next != nil
      if current.next.data == 5000
        break
      else
        current = current.next
      end
    end
  }
  x.report("Delete 5,000th") {
    arr.delete_at(5000)
  }
  x.report("Delete 5,000th") {
    current = llist.head
    while current.next != nil
      if current.next.data == 5000
        current.next = current.next.next
        break
      else
        current = current.next
      end
    end
  }
end
