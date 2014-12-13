// Challenge # 2
// Find the highest frequency character in a given string
// gilbert's solution

function highestFreq (str) {
  var counts = {}
  var highestCount = 0
  
  str.split('').forEach(function (char) {
    counts[char] || (counts[char] = 0)
    counts[char] += 1
    if (counts[char] > highestCount) highestCount = counts[char]
  })
  
  var highestChars = Object.keys(counts).filter(function (char) {
    return counts[char] == highestCount
  })
  
  highestChars.sort()
  return highestChars.join('')
}


// our code 

var counts = {};
var string = "abcdc";
var array = string.split("");
for (var i = 0; i < array.length; i++) {
  var num = array[i];
  counts[num] = counts[num] ? counts[num] + 1 : 1;
}

console.log(counts);


// counts = a:1, b:1, c:2, d:1
// works above for counting occurences


keysSorted = Object.keys(counts).sort(function(key, value){return counts[key]-counts[value]})
alert(keysSorted);    

// higher numbered one at the end. 