# Snail Sort

# Snail Sort Given an array of n x n, return the array elements arranged 
# from outer most elements to the middle element.


array = [[1,2,3],[4,5,6],[7,8,9]]
snail(array) #=> [1,2,3,6,9,8,7,4,5]


# For better understanding, please follow the numbers of the next array consecutively:

array = [[1,2,3],
         [8,9,4],
         [7,6,5]]
snail(array) #=> [1,2,3,4,5,6,7,8,9]

snail = array.shift + array.transpose.reverse
snail.flatten 
=> [1, 2, 3, 6, 9, 5, 8, 4, 7]

def snail(array)
if array.empty?
   []
else 
    array.shift + array.tranpose.reverse
end
end

# shift - Removes the first element of self and returns it 
# (shifting all other elements down by one). 

# array = [[1,2,3],[4,5,6],[7,8,9]]
#  => [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# x = array.shift
#  => [1, 2, 3]
# array
#  => [[4, 5, 6], [7, 8, 9]]

# transpose - Assumes that self is an array of arrays and 
# transposes the rows and columns.

# a = [[1,2], [3,4], [5,6]]
# a.transpose 
#=> [[1, 3, 5], [2, 4, 6]]