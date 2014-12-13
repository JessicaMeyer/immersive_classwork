// Balanced Parenthesis
// Given a string, return true if it contains balanced parenthesis.

// Examples
// Input Output
// string: (x + y) - (4) true
// string: (((10 ) ()) ((?)(:))) true
// string: (50)( false
// string: true


function isBalanced (string) {
 var counter = 0;
 split = string.split("");
 
 split.forEach(function(x) {
   if (x== "(") {
     counter += 1;
   }
   else if (x == ")") {
     counter -= 1;
   }
   if (counter < 0) {
   counter -= 10;
   }
 
 });
   if (counter === 0) {
     return true;
   }
   else {
     return false;
   }
 
}