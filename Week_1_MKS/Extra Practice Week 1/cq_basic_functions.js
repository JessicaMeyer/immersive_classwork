// Code Quizzes - JS - Functions 

// What does the following code print to the console?

function blabbermouth() { };
console.log(blabbermouth.name);

// "blabbermouth"
// functions have a name property that returns the name of a function. 
// JS functions are objects and can have properties like any other object. 

// What does the following code print to the console?

var cat = function(x) {
  return x * 2;
}
console.log(cat.name);
// ""

// The name property for anonymous functions returns an empty string.

// What does the following code print to the console?

blah = function () {
  return lala;
  lala = "hi";
};
console.log(blah());
// lala is not defined

// What does the following code print to the console?

function foo () {
  return bar();
  function bar() {
    return "Poppin' bottles";
  }
}
console.log(foo());

// Poppin' bottles 

// What does the following function print to the console?

function sum(a, b) {
  return a + b;
}
console.log(sum(1, 2, 3, 4));

// 3

// What does the following function print to the console?

function a(x, y, z) {
  return z;
}
console.log(a("blah"));

// undefined
// when too few arguments are supplied to a function, JS assigns the missing arguments to undefined. 

// What does the following code print to the console?

love_story = function(x, y) {
  console.log(arguments);
};
love_story("princess", "frog");

// ["princess", "frog"]
// Arguments is an array-like object that corresponds with the parameters 
// that are passed into a function.

// What does the following code print to the console?

function sum() {
  result = 0;
  arguments.forEach(function (num) {
    result += num;
  });
  return result;
}
sum(1, 2, 3);

// raises an error bc arguments is an array like object, but its not actually an array
// so we can't use the forEach method. 

// What does the following code print to the console?

function c(f) {
  return f();
}
function blub() {
  return "monsters";
}
c(blub);


// "monsters"
// the c() function takes a callback parameter. blub is passed to c() as an argument
// and is invoked within the body of c. functions are first class in js bc they can be passed
// as parameters and stored in data structures. 

// Sort the values in the following array in ascending report: [32, 1, 44, 9]

var array = [32, 1, 44, 9];

array.sort(function(x, y) {
	return x - y;
})

// [1, 9, 32, 44]

// the sort method takes an anonymous callback function as a parameter 

// Write the $$$.map() function so the result variable is assigned to the array [4, 8, 12].

result = $$$.map([2, 4, 6], function(num) {
  return num * 2;
});
console.log(result);

// answer: 

$$$ = {
  map: function(arr, callback) {
    result = [];
    arr.forEach(function (e) {
      result.push(callback(e));
    });
    return result;
  }
}

// Write the $$$.find() function so the result variable is assigned to the string "cat".

arr = ['ant', 'cat', 'dog']
result = $$$.find(arr, function(str) {
  return str[0] === "c";
});
console.log(result);

// answer

$$$ = {
  find: function (arr, callback) {
    for (var i = 0; i < arr.length; i++) {
      var e = arr[i];
      if (callback(e)) {return e};
    }
  }
}

// Write the $$$.select() function so the result variable is assigned to the array [5, 7, 9].

arr = [5, 6, 7, 8, 9];
result = $$$.select(arr, function(num) {
  return num % 2 === 1;
});
console.log(result);

// answer

$$$ = {
  select: function(arr, callback) {
    result = [];
    arr.forEach(function (num) {
      if (callback(num)) {
        result.push(num);
      }
    });
    return result;
  }
}

// Write the $$$.reject() function so the result variable is assigned to 
// the array ['happy', 'slippers'].

arr = ['happy', 'snakes', 'joy', 'slippers'];
result = $$$.reject(arr, function (word) {
  var last_letter = word[word.length - 1];
  return last_letter === "s";
});
console.log(result);

// answer 

$$$ = {
  reject: function (arr, callback) {
    result = [];
    arr.forEach(function(e) {
      if (!callback(e)) {
        result.push(e);
      }
    });
    return result;
  }
}

// Write a function that satisfies the following console.log assertions.

var callback = function (num) {
  return num % 2 === 0
}

console.log($$$.all([1, 3, 4], callback) === false)
console.log($$$.all([2, 6, 4], callback) === true)

// answer

$$$ = {
  all: function (arr, callback) {
    for (var i = 0, l = arr.length; i < l; i ++) {
      if (!callback(arr[i])) {
        return false;
      }
    }
    return true;
  }
}

// Write a function that satisfies the following console.log assertions.

var callback = function (num) {
  return num % 2 === 0
}

console.log($$$.any([1, 3, 4], callback) === true)
console.log($$$.any([1, 11, 111], callback) === false)


// answer 

$$$ = {
  any: function (arr, callback) {
    for (var i = 0, l = arr.length; i < l; i ++) {
      if (callback(arr[i])) {
        return true;
      }
    }
    return false;
  }
}

// Write the $$$.inject() function so the result variable is 
// assigned to the array [1, 4, 9, 16].

var callback = function (num) {
  return num * num;
}

var arr = [1, 2, 3, 4]
result = $$$.inject(arr, [], callback)
console.log(result)

// answer 

$$$ = {
  inject: function (arr, memo, callback) {
    arr.forEach(function (e) {
      memo.push(
        callback(e)
      )
    })
    return memo;
  }
}

// What does the following code print to the console?

result = function surfer() {
  return this === window;
}();
console.log(result);

// true

// What does the following code print to the console?

phone = {
  ring: function () {
    return this === phone;
  }
}
console.log(phone.ring());

// true

// the ring function is invoked as a method so the this keyword is assigned to the phone object 

// What does the following code print to the console?

hat = function () {
  return this;
}

obj1 = {
  check: hat
}

obj2 = {
  check: hat
}

console.log(obj1 === obj1.check())
console.log(obj2 === obj2.check())

// true, true

// when the hat method is bound to obj1, this refers to obj 1
// same thing for object 2
// the this keyword for a given method can be assigned to different objects depending on the invocation content for the method

// What does the following code print to the console?

function Builder () {
  this.self = function () {
    return this;
  }
}
b = new Builder();
console.log(b.self() === b);

// true
// For constructor functions, "this" refers to the object that's created by 
// the constructor function.

dude = {
  greet: "hi",
  bye: "peace"
}

function a () {
  return this.greet + ", " + this.bye;
}

console.log(a.apply(dude));

// "hi, peace"

// The apply() method is defined for function objects and accepts an 
// object as the first parameter. The object that's passed to apply() as an 
// argument is assigned to "this" when the function is invoked.

// What does the following code print to the console?

function full_name (first, last) {
  return first + " " + last + ": " + this.age;
}

shredder = {
  age: 37
}
console.log(full_name.apply(shredder, ["evil", "badguy"]));

// evil badguy: 37
// The apply() method takes an array of arguments as the second parameter.

// What does the following code print to the console?

function sum (x, y) {
  return this.name + ", the sum is " + (x + y);
}

person = {
  name: "Phil"
}

console.log(sum.call(person, 2, 2));

// Phil, the sum is 4
// The call() method is similar to apply(), but it takes the parameters 
// as arguments instead of an array.

// Use the teamCity() function and teams array to create the following 
// array ['Giants from New York', 'Seahawks from Seattle'].

function Team(name, city) {
  this.name = name;
  this.city = city;
}

teams = [
  new Team("Giants", "New York"),
  new Team("Seahawks", "Seattle")
]

function teamCity () {
  return this.name + " from " + this.city;
}

result = []
teams.forEach(function (team) {
  result.push(teamCity.call(team));
});
console.log(result);

//["Giants from New York", "Seahawks from Seattle"]

// What does the following code print to the console?

function dog () {};
console.log(dog.name);
// "dog"

// Functions have a name property that corresponds with the name of the function.

// What does the following code print to the console?

var boo = function () {};
console.log(boo.name);

// ""
// Anonymous functions also have a name property, but it returns the empty string.

// Write a recursive factorial function and then verify that the factorial of 4 equals 24.

function factorial(n) {
  if (n == 0) { return  1; }
  return n * factorial(n - 1);
}
console.log(factorial(4));
// 24

// What does the following code print to the console?

var happy = {
  hi: function sing(n, result) {
    result = typeof result !== 'undefined' ? result : [];
    if (n == 0) {
      result.push("No more bottles");
      return result;
    }
    var str = n + " bottles";
    result.push(str);
    return sing(n - 1, result);
  }
}

console.log(happy.hi(3));
//["3 bottles", "2 bottles", "1 bottles", "No more bottles"]

// The happy object has a hi property that points to the named function 
// sing(). Object values are typically anonymous functions, but they can 
// also be named functions. A named function works well in this example to 
// allow for recursion.

// What does the following code print to the console?

function dinero () {};
dinero.meaning = "money";
console.log(dinero.meaning);
// money
// Functions are objects and can be assigned properties, just like any other object.

// Describe what happens when the Helpers.factorial(3) function is run twice.

var Helpers = {
  cache: {},
  factorial: function (n) {
    if (this.cache[n]) { return this.cache[n]; };
    var counter = 1;
    var result = 1;
    while (counter <= n) {
      result *= counter;
      counter++;
    }
    this.cache[n] = result;
    return result;
  }
}

Helpers.factorial(3) // 6
Helpers.factorial(3) // 6

// The factorial is cached in an object, so it does not need to be recomputed 
// if it has already been calculated. When Helpers.factorial(3) is initially 
// run, the factorial is computed and cached. When Helpers.factorial(3) is run 
// again, the cached value is returned without performing the computations again.

// Caching requires extra memory and makes the code more complex, but it is 
// a very useful tactic for expensive calculations. Caching is also referred 
// to as memoization.

// Write a function called biggestArg() that takes a variable number of integer 
// arguments and returns the largest integer. biggestArg(1, 3, 33, 4) should return 33.

function biggestArg () {
  return Math.max.apply(Math, arguments)
}

// We don't need to use Math as the first argument for the apply() function, 
// but it makes the code more readable. This code would also work:

Math.max.apply("", arguments)

// Write a function called mergeObjects() that takes a variable number of 
// objects as parameters and returns a single object with all the properties from the 
// individual objects. 
// mergeObjects({some: "thing"}, {cool: "jerk", phat: "cow"}, {holy: "moly"}) 
// should return {some: "thing", cool: "jerk", phat: "cow", holy: "moly"}.

function mergeObjects () {
  var result = arguments[0];
  for (var i = 1, l = arguments.length; i < l; i ++) {
    var arg = arguments[i];
    for (var key in arg) {
      result[key] = arg[key];
    }
  }
  return result;
}

// Why doesn't the following code work?

function badSortArgs () {
  var result = arguments.sort(function (x, y) {
    return x - y;
  });
  return result;
}
badSortArgs(1, 44, 3);

// arguments is an array-like object, but it's not actually an array. 
// The sort() method is not defined for the arguments object.

// Define a goodSortArgs() function that takes a variable number of integer 
// arguments and returns a sorted array. goodSortArgs(1, 44, 3) should return [1, 3, 44].

function goodSortArgs () {
  var args = Array.prototype.slice.call(arguments, 0);
  var result = args.sort(function (x, y) {
    return x - y;
  });
  return result;
}
goodSortArgs(1, 44, 3)
// [1, 3, 44]

//What does the following code print to the console?

function b (x, y, z) {};
console.log(b.length);
// 3
// Functions have a length property that corresponds with the number of named parameters.

// What does the following code print to the console?

function a () {};
console.log(a.length);
// 0

