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

// Challenge # 2
// Find the highest frequency character in a given string

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


// Challenge # 3

// our solution 

function alphaCount (alphabet, text) {
  var counts = Array.apply(null, new Array(alphabet.length)).map(Number.prototype.valueOf,0);
  var alpha = alphabet.toLowerCase();
  var t = text.toLowerCase();
  
  for (i = 0; i < t.length; i++){
    if (alpha.indexOf(t[i]) !== -1){
      counts[alpha.indexOf(t[i])] += 1;
    }
    
  } 
  //console.log(counts);
  
  var answer = "";
  for (i=0; i< alpha.length;i++){
    if (counts[i] !== 0){
      answer = answer + alpha[i] + ":" + counts[i] + ",";
    }
  }
  
  if (answer === ""){
    answer = "no matches";
  }
  else{
    answer = answer.slice(0,-1); //remove last comma
  }
  
  return answer;
  
}

console.log(alphaCount( "aBc", "aabbccdd"));

// Gilbert's solution for challenge #3 

// alphabet: "bac", text: "aabbcccdd"
// target output: 'b:2,a:2,c:3'
function alphaCount (alphabet, text) {
  var counts = {}
  text.toLowerCase().split('').forEach(function (c) {    
    counts[c] || (counts[c] = 0)
    counts[c] += 1
  })
  // counts => { a: 2, b: 2, c: 3, d: 2 }

  var output = []
  alphabet.toLowerCase().split('').forEach(function (c) {
    if (counts[c] == undefined) return;
    output.push(c + ':' + counts[c])
  })
  // output => ['b:2', 'a:2', 'c:3']

  if (output.length > 0) {
    return output.join(',')
  }
  else {
    return "no matches"
  }
}


// challenge - our solution 

// given a string, remove any characters that are not unique from the string

function onlyUnique (str) {
  
  var r = str.split("");
  var count = {};
  
  r.forEach(function(e) {
    count[e] || (count[e] = 0);
    count[e] += 1;
    // return count;
  })
  
 var result = r.filter(function(e) {
    return count[e] === 1;
  
  })
  
  return result.join("");
}



// Given an array, find the length of the longest increasing sequence.

array = [10,20, 10, 30, 30]

function longestImprovement (numbers) {
  // Write your code here, and
  // return your final answer.
  var counter = 0;
  var counts = []
  for (var i = 0; i < numbers.length; i++){
        if (i === 0) {  
      counter++;          
      } else if (numbers[i] > numbers[i - 1]) {  
        counter++;  
        } else { counts.push(counter);  
        counter = 1; 
        } 
   if ( i === (numbers.length - 1)) { 
     counts.push(counter); 
   } 
  }
  var winner = counts.sort().reverse()[0]
  return winner
}

// Character Sum
// Given a string of arbitrary size, convert each character into its integer 
// equivalent and sum the entirety.

function charSum(str) {
  var a = 0;
  for(var i = 0; i < str.length; i++) {
    if(parseInt(str[i])) {
      a += parseInt(str[i])
    }
  }
  return a;
}


// Gilbert's solution 
function charSum(str) {
  var a = 0;
  for(var i = 0; i < str.length; i++) {
   var n = parseInt(str[i])
   if (n) a = a + n
 }
return a;
}