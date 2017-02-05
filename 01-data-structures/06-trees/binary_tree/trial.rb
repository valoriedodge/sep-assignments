require_relative 'binary_search_tree'
require_relative 'min_heap_tree'

root = Node.new("The Matrix", 87)
pacific_rim = Node.new("Pacific Rim", 72)
braveheart = Node.new("Braveheart", 78)
jedi = Node.new("Star Wars: Return of the Jedi", 80)
donnie = Node.new("Donnie Darko", 85)
inception = Node.new("Inception", 86)
district = Node.new("District 9", 90)
shawshank = Node.new("The Shawshank Redemption", 91)
martian = Node.new("The Martian", 92)
hope = Node.new("Star Wars: A New Hope", 93)
empire = Node.new("Star Wars: The Empire Strikes Back", 94)
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)

nodes = [pacific_rim, braveheart, jedi, donnie, inception, district, shawshank, martian, hope, empire, mad_max_2]

binary_tree = BinarySearchTree.new(root)
heap_tree = MinHeapTree.new

nodes.each do |node|
  binary_tree.insert(root, node)
  heap_tree.insert(node)
end
p "heap"
heap_tree.print
p "binary tree"
binary_tree.printf
