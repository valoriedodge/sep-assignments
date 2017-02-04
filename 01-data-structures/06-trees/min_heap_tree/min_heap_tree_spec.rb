include RSpec

require_relative 'min_heap_tree'

RSpec.describe MinHeapTree, type: Class do


  let (:heap) { MinHeapTree.new }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node in array" do
      heap.insert(martian)
      expect(heap.tree[1].title).to eq "The Martian"
    end

    it "properly inserts a new node as a left child" do
      heap.insert(pacific_rim)
      heap.insert(martian)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[2].title).to eq "The Martian"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(pacific_rim)
      heap.insert(martian)
      heap.insert(braveheart)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[3].title).to eq "Braveheart"
    end

    it "properly inserts a new node as a left-left child" do
      heap.insert(pacific_rim)
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(martian)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[4].title).to eq "The Martian"
    end

    it "properly inserts a new node as a left-left child with rearrangement" do
      heap.insert(pacific_rim)
      heap.insert(martian)
      heap.insert(jedi)
      heap.insert(braveheart)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[2].title).to eq "Braveheart"
      expect(heap.tree[4].title).to eq "The Martian"
    end

    it "properly inserts a new node as root node" do
      heap.insert(martian)
      expect(heap.tree[1].title).to eq "The Martian"
      heap.insert(pacific_rim)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[2].title).to eq "The Martian"
    end

    it "properly inserts a new node as root node and keeps heap structure" do
      heap.insert(jedi)
      expect(heap.tree[1].title).to eq "Star Wars: Return of the Jedi"
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(pacific_rim)
      expect(heap.tree[1].title).to eq "Pacific Rim"
      expect(heap.tree[4].title).to eq "Star Wars: Return of the Jedi"
    end


  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(empire)
      heap.insert(mad_max_2)
      expect(heap.find(nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(pacific_rim)
      heap.insert(hope)
      expect(heap.find(hope.title).title).to eq "Star Wars: A New Hope"
    end

    it "properly finds a deep node" do
      heap.insert(pacific_rim)
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(donnie)
      heap.insert(hope)
      heap.insert(empire)
      heap.insert(shawshank)
      expect(heap.find(pacific_rim.title).title).to eq "Pacific Rim"
      expect(heap.find(empire.title).title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "returns nil if not in heap" do
      heap.insert(pacific_rim)
      heap.insert(jedi)
      expect(heap.find(hope.title)).to eq nil
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(hope)
      heap.delete(hope.title)
      expect(heap.find(hope.title)).to be_nil
    end

    it "properly deletes a node and preserves heap one" do
      heap.insert(pacific_rim)
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(donnie)
      heap.insert(hope)
      heap.insert(empire)
      heap.insert(shawshank)
      heap.delete(pacific_rim.title)
      expect(heap.tree[1].title).to eq "Braveheart"
      expect(heap.find(pacific_rim)).to be_nil
    end

    it "properly deletes a node and preserves heap two" do
      heap.insert(pacific_rim)
      heap.insert(jedi)
      heap.insert(braveheart)
      heap.insert(martian)
      heap.insert(donnie)
      heap.insert(hope)
      heap.insert(empire)
      heap.insert(shawshank)
      heap.delete(braveheart.title)
      expect(heap.tree[3].title).to eq "The Martian"
      expect(heap.find(pacific_rim)).to be_nil
    end
  end

  describe "#print" do
    specify {
      expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nThe Martian: 92\n"
      heap.insert( hope)
      heap.insert( empire)
      heap.insert( jedi)
      heap.insert( martian)
      heap.insert( pacific_rim)
      expect { heap.print }.to output(expected_output).to_stdout
    }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nDistrict 9: 90\nThe Martian: 92\nStar Wars: A New Hope: 93\nInception: 86\nStar Wars: The Empire Strikes Back: 94\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\n"
       heap.insert( hope)
       heap.insert( empire)
       heap.insert( jedi)
       heap.insert( martian)
       heap.insert( pacific_rim)
       heap.insert( inception)
       heap.insert( braveheart)
       heap.insert( shawshank)
       heap.insert( district)
       heap.insert( mad_max_2)
       expect { heap.print }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nInception: 86\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       heap.insert( mad_max_2)
       heap.insert( district)
       heap.insert( shawshank)
       heap.insert( braveheart)
       heap.insert( inception)
       heap.insert( pacific_rim)
       heap.insert( martian)
       heap.insert( jedi)
       heap.insert( empire)
       heap.insert( hope)
       expect { heap.print }.to output(expected_output).to_stdout
     }
  end
end
