// Semantic Sort
// A "semantic version" is a string of format x.y.z, where x is the major version number, y is the minor version number, and z is the patch version number. Given a newline-separated string with these version numbers, return a newline-separated string with the versions sorted from highest to lowest. When sorting, x takes priority over y, and y takes priority over z.

// Examples
// (!!!) NOTICE: Newline characters in the inputs have been replaced with <br /> tags to make the value easier to read.

// Input	Output
// versionsString: 2.0.0
// 1.0.0
// 3.0.0	3.0.0
// 2.0.0
// 1.0.0
// versionsString: 1.0.0
// 2.99.5	2.99.5
// 1.0.0
// versionsString: 1.0.1
// 1.0.10	1.0.10
// 1.0.1

function semSort (versionsString) {
  
  var string = versionsString.replace( /\n/g, " " ).split( " " )
  var sortString = string.sort().reverse().toString();
  
  var formattedString = sortString.split(",").join("\n")
  
  return formattedString;
  
  
}

//split elements on the dot 


// gilbert's solution 

function semSort (versionsString) {
  return versionsString.split("\n")
  .sort(function (a,b) {
    var as = a.split('.')
      , bs = b.split('.')
    
    return (bs[0] - as[0]) ||
           (bs[1] - as[1]) ||
           (bs[2] - as[2])
  }).join("\n")
}