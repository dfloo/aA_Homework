class Map

  def initialize
    @map = []
  end

  def set(key, value)
    pair_idx = @map.index { |el| el[0] == key }
    if pair_idx
      @map[pair_idx][1] = value
    else
      @map << [key, value]
    end
    value
  end

  def get(key)
    @map.each {|el| return el[-1] if el[0] == key}
    nil
  end

  def delete(key)
    @map.reject! {|el| el[0] == key}
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end

end
