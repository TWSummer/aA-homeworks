class LRUCache

  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    @cache.count { |el| !el.nil? }
  end

  def add(el)
    new_arr = [el]
    @cache.each do |cache_el|
      new_arr << cache_el if cache_el != el && new_arr.length < @cache.length
    end
    @cache = new_arr
  end

  def show
    @cache.reverse
  end
end


johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
