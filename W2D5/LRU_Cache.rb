class LRUCache
  def initialize(size)
    @cache = Array.new(size)
    @size = size
  end

  def count
    # returns number of elements currently in cache
    count = 0
    @cache.each do |el|
      count += 1 if el
    end
    count
  end

  def add(el)
    # adds element to cache according to LRU principle
    @cache.delete(el) if @cache.include?(el)
    if @cache.count < @size
      @cache.push(el)
    else
      @cache.shift
      @cache.push(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    print @cache
  end

  private
  # helper methods go here!

end
