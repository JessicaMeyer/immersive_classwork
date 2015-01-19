function getProp (propName, object) {
	return object[propName]
}

// this first one the same as the function below it 

var getMood = getProp.bind(null, 'mood')  // the mood there is like hardcoding a value into the function
var getMood = function (object) {
	var propName = 'mood'
	object[propName]
}

var alice = { mood: 'happy' }
var bob = { mood: 'subtle' }

var y = getProp.bind(null, 'mood')(bob) // immediately calling it at the end with bob

var z = [alice, bob].map(getProp.bind(null, 'mood'))

var getAliceMethod = getProp.bind(null, 'mood', alice)
var getAliceMethod = function () {
	var propName = 'mood' // kind of like initializing the parameters that go in the getProp method 
	var object = alice
	return obj[propName] // this function body stays the same
}


// function getProp (propName, object) {
//   return object[propName]
// }

// var getMood = getProp.bind(null, 'mood')
// var getMood = function (object) {
//   var propName = 'mood'
//   object[propName]
// }

// var alice = { mood: 'happy' }
// var bob = { mood: 'subtle' }


// var getAliceMood = getProp.bind(null, 'mood', alice)
// var getAliceMood = function () {
//   var propName = 'mood'
//   var object = alice
//   return obj[propName]
// }
// getAliceMood()



// var y = getProp.bind(null, 'mood')(bob)

// var z = [alice, bob].map(getProp.bind(null, 'mood'))

// var getMood = getProp.bind(null, 'mood')
// var z = [alice, bob].map(getMood)