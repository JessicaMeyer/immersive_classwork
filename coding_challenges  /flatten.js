// Challenge # 1
// Flatten an array of arrays in Javascript

array1 = [10,[20, 30], 40]
array2 = [1, 2, [3], 4,[5, 6]]

var merged = array1.concat(array2); // merged but does not flatten 

// solution 

function flatten (arrays) {
  var merged = [];
  merged = merged.concat.apply(merged, arrays);
  return merged;
}

// concat and apply - work to flatten an array like .flatten in Ruby 

// ruby version 

array1 = [1, 2, [3], 4, [5, 6]]
array2 = [[10], [20, 30], [40]]
merged = array1 + array2
 // => [1, 2, [3], 4, [5, 6], [10], [20, 30], [40]]
merged.flatten
// => [1, 2, 3, 4, 5, 6, 10, 20, 30, 40]

