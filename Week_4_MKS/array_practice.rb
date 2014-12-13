# Create a method that finds the largest number in an array. (Don't use the max method)
# Returns a single integer that is the largest value in the array

def max(array)
    if array.size == 0
        return nil 
    end 
    max = array.first
    array.each do |x| 
        if x > max
            max = x
        end
    end
    max
end

# Write a method that returns the middle element of an array. If there isn't an exact middle, return the average of the middle 2.

# Returns the value of the middle element. If there are 2 middle spots, return the average

def middle_element(array)
  if array.size == 0
    nil
  elsif array.size % 2 == 0
    (array[array.size / 2] + array[(array.size/2) - 1]).to_f / 2
  else
    array[array.size / 2]
  end
end


# Build a method that takes 2 arrays of equal size and returns an array that has a sum of the elements in each position. 
# Example sum_arrays([4,2,6], [8,5,6]) # => [12, 7, 12]


# Returns an array that has the sum of the values in the 2 inputs

def sum_arrays(array1, array2)
  res = []
  array1.size.times do |index|
    res << (array1[index] + array2[index])
  end
  res
end