# 1- BIG 0-CTOPUS AND BIGGEST FISH

# quadratic search
def sluggish_octopus(arr)
  arr.each_with_index do |fish1, idx1|
    max_length = true

    arr.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end

end


class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      else
        merged << right.shift
      end
    end

    result + left + right
  end
end

# nlogn search
def dominant_octopus(arr)
  arr.merge_sort(&prc).last
end

# linear search
def linear_biggest_fish(arr)
  longest_fish = arr.first

  arr.each do |fish|
    if fish.length > longest_fist.length
      longest_fish = fish
    end
  end
  longest_fish
end

# 2-DANCING OCTOPUS
# slow dance
tiles_array = ["up","right-up","right","right-down","down","left-down","left","left-up"]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

# constant octopus dance

tiles_hash = {
  'up' => [1,0],
  'right-up' => [1,1],
  'right' => [0,1],
  'right-down' => [-1,1],
  'down' => [-1,0],
  'left-down' => [-1,-1],
  'left' => [0,-1],
  'left-up' => [1,-1]
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
