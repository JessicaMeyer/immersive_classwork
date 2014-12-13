// Arrayception
// Given an array of arbitrarily nested arrays, retun n, where n is the deepest level that contains a non-array value.

// Examples
// Input	Output
// array: [ [ 5 ], [ [ ] ] ]	2
// array: [ 10, 20, 30, 40 ]	1
// array: [ [ 10, 20 ], [ [ 30, [ 40 ] ] ] ]	4
// array: [ ]	0
// array: [ [ [ ] ] ]	0

// arrayception  - gilbert's solution 

function arrayception (array) {
  return (getDepth(array) || 1) - 1
}

function getDepth (elem) {
  if (elem instanceof Array) {
    if (elem.length === 0) return 0;
    
    var value = Math.max.apply(Math, elem.map(getDepth))
    return value === 0 ? value : value + 1
  }
  else {
    return 1
  }
}


// our work 