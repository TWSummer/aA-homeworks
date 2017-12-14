def sluggish_octopus(fish)
  i = 0
  while i < fish.length
    j = 0
    longest_fish = true
    while j < fish.length
      if fish[i].length < fish[j].length
        longest_fish = false
      end
      j += 1
    end
    return fish[i] if longest_fish
    i += 1
  end
end

def merge_sort (array, &prc)
  return array if array.length <= 1

  mid_idx = array.length / 2
  merge(
    merge_sort(array.take(mid_idx), &prc),
    merge_sort(array.drop(mid_idx), &prc),
    &prc
  )
end

def merge(left, right, &prc)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end
  merged_array + left + right
end

def dominant_octopus(fish)
  merge_sort(fish) { |a, b| b.length <=> a.length }[0]
end

def clever_octopus(fish)
  longest = ""
  fish.each do |swimmer|
    longest = swimmer if swimmer.length > longest.length
  end
  longest
end

def slow_dance(move, tiles)
  tiles.find_index(move)
end

def constant_dance(move, tiles_hash)
  tiles_hash[move]
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
puts sluggish_octopus(fish)
puts dominant_octopus(fish)
puts clever_octopus(fish)
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
puts slow_dance("left-down", tiles_array)
tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
              "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7 }
puts constant_dance("left-down", tiles_hash)
