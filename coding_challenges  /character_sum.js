// Character Sum
// Given a string of arbitrary size, convert each character into its integer equivalent and sum the entirety.

// Examples
// Input Output
// str: 123  6
// str: 0101 2
// str: so cool!!1!  1

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