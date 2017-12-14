

food = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(food)
  result = ""
  count = 0
  food.each_with_index do |fish, idx|
    food.each_with_index do |fish2, idx2|
      next if idx == idx2
      result = fish if fish.size > fish2.size && fish.size > count
      count = fish.size
    end
  end
  result
end

def dominant(food)
  merge_sort(food).last
end

def merge_sort(array)
  result = []
  return array if array.size <= 1
  mid = array.size/2
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])

  until left.empty? || right.empty?
    if left.first.size < right.first.size
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end

def clever(food)
  big_fish = ""
  count = 0
  food.each do |fish|
    big_fish = fish if fish.size > count
  end
  big_fish
end





def slow_dance(dir, tiles_array = nil)
  tiles_array ||= ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  tiles_array.each_with_index do |el, idx|
    return idx if el == dir
  end
  nil
end


def constant_dance(dir, new_tiles_data_structure = nil)
  new_tiles_data_structure = { "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }
  new_tiles_data_structure[dir]
end
