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
