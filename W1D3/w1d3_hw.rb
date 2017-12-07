require "byebug"

def sum_to(num)
  if num == 0 || num == 1
    return num
  elsif num < 0
    return nil
  else
    return num + sum_to(num-1)
  end
end

def add_numbers(nums_array)
  if nums_array == []
    return nil
  elsif nums_array.length == 1
    return nums_array.first
  else
    temp = nums_array.dup
    return temp.pop + adds_numbers(temp)
  end

end

def gamma_fnc(num)
  if num == 0
    return 1
  elsif num == 1
    return 1
  else
    return ((num-1)*(gamma_fnc(num-1)))
  end
end

def ice_cream_shop(flavors, favorite)
  if flavors.empty?
    return false
  elsif flavors.length == 1
    return flavors.first == favorite
  else
    return flavors.pop == favorite || ice_cream_shop(flavors, favorite)
  end
end

def reverse(string)
  if string.empty?
    return ""
  else
    return string.slice!(-1) + reverse(string)
  end
end

def quicksort(array)
  if array.length < 2
    return array
  else
    lhs = []
    rhs = []
    pivot = array[0]

    lhs = array[1..-1].select {|el| el < pivot}
    rhs = array[1..-1].select {|el| el >= pivot}

    return quicksort(lhs) + [pivot] + quicksort(rhs)
  end
end
