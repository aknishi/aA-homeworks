require 'LRUCache'

describe LRUCache do
  subject(:cache) {LRUCache.new(4)}

  describe "#initialize" do
    it "initializes the class with a size argument" do
      expect(cache.size).to eq(4)
    end
  end

  describe "#add" do
    before(:each) do
      cache.add(4)
      cache.add([1,2,3])
      cache.add("hello")
      cache.add("23")
    end
    it "adds an element at the end of the cache" do
      expect {cache.show}.to output("[4, [1, 2, 3], \"hello\", \"23\"]\n").to_stdout
    end

    it "should not add more items than the cache size" do
      cache.add(39)
      expect(cache.count).to eq(4)
    end

    it "should not add more items than the cache size" do
      cache.add([1,2,3])
      expect {cache.show}.to output("[4, \"hello\", \"23\", [1, 2, 3]]\n").to_stdout
    end

  end

end
