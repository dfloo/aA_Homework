def sluggish_octopus(fish_arr)
  fish_arr.each_with_index do |fish, i|
    longest = true

    fish_arr.each_with_index do |fish2, j|
      next if i == j
      lengest = false if fish2.length > fish.length
    end

    return fish if longest
  end
end

def dominant_octopus(fish_arr)

  return fish_arr.first if fish_arr.length == 1

  mid = fish_arr.length / 2
  sorted_left = dominant_octopus(fish_arr[0...mid])
  sorted_right = dominant_octopus(fish_arr[mid..-1])

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    if left[0] <= right[0]
      result << left.shift
    else
      result << right.shift
    end

    result.concat(left)
    result.concat(right)

    result
end

def clever_octopus(fish_arr)

  longest = fish_arr[0]

  fish_arr.each_with_index do |fish, i|
    if fish.length > longest.length
      longest = fish
    end
  end

  longest
end

def slow_dance(direction, tiles_arr)
  tiles_arr.each_with_index do |tile, i|
    return i if tile == direction
  end
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
