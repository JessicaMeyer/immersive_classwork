// Only Unique
// Given an string, remove any characters that are not unique from the string.

// Examples
// Input Output
// str: abccdefe abdf
// str: hello there  o tr
// str: xyz  xyz
// str: iiii

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