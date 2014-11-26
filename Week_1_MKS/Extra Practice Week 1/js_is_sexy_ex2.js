// JS Prototype in Plain Language 
// http://javascriptissexy.com/javascript-variable-scope-and-hoisting-explained/

// Local variables have priority over global variables in functions 

// JS Closures 
// http://javascriptissexy.com/understand-javascript-closures-with-ease/

// You create a closure by adding a function inside another function.
// A Basic Example of Closures in JavaScript: 

function showName (firstName, lastName) { 
​var nameIntro = "Your name is ";
    // this inner function has access to the outer function's variables, including the parameter​
​function makeFullName () {         
​return nameIntro + firstName + " " + lastName;     
}
​
​return makeFullName (); 
} 
​
showName ("Michael", "Jackson"); // Your name is Michael Jackson 

// A Classic jQuery Example of Closures: 

$(function() {
​
​var selections = []; 
$(".niners").click(function() { // this closure has access to the selections variable​
selections.push (this.prop("name")); // update the selections variable in the outer function's scope​
});
​
});


// Closures’ Rules and Side Effects

// Closures have access to the outer function’s variable even after the outer function returns:
// One of the most important and ticklish features with closures is that the inner function still 
// has access to the outer function’s variables even after the outer function has returned. 
// When functions in JavaScript execute, they use the same scope chain that was in effect when 
// they were created. This means that even after the outer function has returned, the inner function 
// still has access to the outer function’s variables. Therefore, you can call the inner function 
// later in your program. This example demonstrates:

function celebrityName (firstName) {
    var nameIntro = "This celebrity is ";
    // this inner function has access to the outer function's variables, including the parameter​
   function lastName (theLastName) {
        return nameIntro + firstName + " " + theLastName;
    }
    return lastName;
}
​
​var mjName = celebrityName ("Michael"); // At this juncture, the celebrityName outer function has returned.​
​
​// The closure (lastName) is called here after the outer function has returned above​
​// Yet, the closure still has access to the outer function's variables and parameter​
mjName ("Jackson"); // This celebrity is Michael Jackson 


// UNDERSTANDING CALL BACK FUNCTIONS

// http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/

// Because functions are first-class objects, we can pass a function as an argument in another 
// function and later execute that passed-in function or even return it to be executed later.

// A callback function, also known as a higher-order function, is a function that is 
// passed to another function (let’s call this other function “otherFunction”) as a 
// parameter, and the callback function is called (or executed) inside the otherFunction. 
// A callback function is essentially a pattern (an established solution to a common problem),
// and therefore, the use of a callback function is also known as a callback pattern.

// Consider this common use of a callback function in jQuery:

//Note that the item in the click method's parameter is a function, not a variable.​
​//The item is a callback function

$("#btn_1").click(function() {
  alert("Btn 1 Clicked");
});

// As you see in the preceding example, we pass a function as a parameter to the click method. 
// And the click method will call (or execute) the callback function we passed to it. 
// This example illustrates a typical use of callback functions in JavaScript, and one widely 
// used in jQuery.

// Ruminate on this other classic example of callback functions in basic JavaScript:

var friends = ["Mike", "Stacy", "Andy", "Rick"];
​
friends.forEach(function (eachName, index){
console.log(index + 1 + ". " + eachName); // 1. Mike, 2. Stacy, 3. Andy, 4. Rick​
});
// Again, note the way we pass an anonymous function (a function without a name) to the 
// forEach method as a parameter.
















