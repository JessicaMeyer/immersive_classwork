// Longest Improvement
// Given an array, find the length of the longest increasing sequence.

// Examples
// Input	Output
// numbers: [ 10 ]	1
// numbers: [ 10, 20, 30, 10, 20 ]	3


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