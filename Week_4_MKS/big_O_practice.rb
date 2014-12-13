# Solve the following problems and in a comment above the method, note the Big O of your solution. 
# Look at the set1 directory of the arrays branch in algorithms repo

# Swap the smallest number in the array with the first element. Eg. swap_small([5,7,2,9]) # => [2, 7, 5, 9]

#0(n)
def self.swap_small(array)
    small_index = 0
    small_element = array.first

    for i in 0...array.length
      if small_element > array[i]
        small_element = array[i]
        small_index = i
      end
    end

    array[small_index] = array[0]
    array[0] = small_element
    array
  end


# Given an array of numbers, find out if there are two numbers in the array that add up 
# to 0 (just return true or false). You can use the same number multiple times.

# O(n^2)
  def self.find_sum_2(array, sum = 0)
    for i in 0...array.length
      for j in i...array.length
        if array[i] + array[j] == sum
          return true
        end
      end
    end

    false
  end


# Same problem as above except check if there are 3 numbers in the array that add up to 0. You can use the same number multiple times.

  # O(n^3)
  def self.find_sum_3(array)
    for i in 0...array.length
      if find_sum_2(array, -1 * array[i])
        return true
      end
    end

    false
  end
end