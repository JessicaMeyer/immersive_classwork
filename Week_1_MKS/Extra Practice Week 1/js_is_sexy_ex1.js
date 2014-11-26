// From the JS is Sexy website 
// http://javascriptissexy.com/javascript-objects-in-detail/

// Objects in Detail 

// simple (primitive) data types - Number, String, Boolean, Undefined and Null (immutable)
// Objects are mutable

// Objects are an unordered list of primitive data types, stored as name-value pairs
// Each item in the list is a property (functions are methods)

var myFirstObject = {
	firstName: "Richard",
	favoriteAuthor: "Conrad"
};

// Think of an objects as a list that contains items, and each item (a property or a method) in the list
// is stored bya  name-value pair. 

// Property names can be a string or a number, but if the property name is a number, it has to 
// be accessed with the bracket notation

var ageGroup = {
	30: "Children", 
	100:"Very Old"
};
console.log(ageGroup["30"]); // "Children"


// change the name

var person = {name: "Kobe"};
​var anotherPerson = person;
person.name = "Bryant";
​
console.log(anotherPerson.name); // Bryant​
console.log(person.name); // Bryant

// We copied the person object to anotherPerson, but because the value in person was stored as a 
// reference and not an actual value, when we changed the person.name property to “Bryant” the 
// anotherPerson reflected the change because it never stored an actual copy of it’s own value of 
// the person’s properties, it only had a reference to it.

// Constructor Pattern for Creating Objects

function Fruit (theColor, theSweetness, theFruitName, theNativeToLand) {
​
    this.color = theColor;
    this.sweetness = theSweetness;
    this.fruitName = theFruitName;
    this.nativeToLand = theNativeToLand;
​
    this.showName = function () {
        console.log("This is a " + this.fruitName);
    }
​
    this.nativeTo = function () {
    this.nativeToLand.forEach(function (eachCountry)  {
       console.log("Grown in:" + eachCountry);
        });
    }
​
​
}

// With this pattern in place, it is very easy to create all sorts of fruits. Thus:

var mangoFruit = new Fruit ("Yellow", 8, "Mango", ["South America", "Central America", "West Africa"]);
mangoFruit.showName(); // This is a Mango.​
mangoFruit.nativeTo();
​// Grown in:South America​
​// Grown in:Central America​
​// Grown in:West Africa​
​
​var pineappleFruit = new Fruit ("Brown", 5, "Pineapple", ["United States"]);
pineappleFruit.showName(); // This is a Pineapple.

// — An inherited property is defined on the object’s prototype property. For example: 
// someObject.prototype.firstName = “rich”;

// — An own property is defined directly on the object itself, for example:
// Let’s create an object first:

var aMango = new Fruit ();

// Now we define the mangoSpice property directly on the aMango object

// Because we define the mangoSpice property directly on the aMango object, it is an own 
// property of aMango, not an inherited property.

aMango.mangoSpice = “some value”;

// — To access a property of an object, we use object.property, for example:

console.log(aMango.mangoSpice); // “some value”

 // — To invoke a method of an object, we use object.method(), for example :
// First, lets add a method

aMango.printStuff = function () {return “Printing”;}

// Now we can invoke the printStuff method:

aMango.printStuff ();

// Create a new school object with a property name schoolName​

​var school = {schoolName:"MIT"};
​
​// Prints true because schoolName is an own property on the school object​

console.log("schoolName" in school);  // true​
​
​// Prints false because we did not define a schoolType property on the school object, 
// and neither did the object inherit a schoolType property from its prototype object Object.prototype.​

console.log("schoolType" in school);  // false​

// hasOwnProperty 
// to Find out if an object has a specific property as one of it's own properties - use hasOP

// To access the enumerable (own and inherited) properties on objects, you use the for/in loop 
// or a general for loop.

// Create a new school object with 3 own properties: schoolName, schoolAccredited, and schoolLocation.​
​
var school = {schoolName:"MIT", schoolAccredited: true, schoolLocation:"Massachusetts"};
​
​// Use of the for/in loop to access the properties in the school object​
​
for (var eachItem in school) {
console.log(eachItem); // Prints schoolName, schoolAccredited, schoolLocation​
​
}

//

​function HigherLearning () {
​this.educationLevel = "University";
}
​
​// Implement inheritance with the HigherLearning constructor​
​var school = new HigherLearning ();
school.schoolName = "MIT";
school.schoolAccredited = true;
school.schoolLocation = "Massachusetts";
​
​
​//Use of the for/in loop to access the properties in the school object​

​for (var eachItem in school) {
console.log(eachItem); // Prints educationLevel, schoolName, schoolAccredited, and schoolLocation​
}


// Serialize and Deserialize Objects

// To transfer your objects via HTTP or to otherwise convert it to a string, 
// you will need to serialize it (convert it to a string); you can use the JSON.stringify 
// function to serialize your objects. Note that prior to ECMAScript 5, you had to use a 
// popular json2 library (by Douglas Crockford) to get the JSON.stringify function. It is now 
// standardized in ECMAScript 5.

// To Deserialize your object (convert it to an object from a string), you use the JSON.parse 
// function from the same json2 library. This function too has been standardized by ECMAScript 5.

// JSON.stringify Examples:

var christmasList = {mike:"Book", jason:"sweater", chelsea:"iPad" }
JSON.stringify (christmasList);
​// Prints this string:​

​// "{"mike":"Book","jason":"sweater","chels":"iPad"}"  
​
​// To print a stringified object with formatting, add "null" and "4" as parameters:​

JSON.stringify (christmasList, null, 4);
// "{
    "mike": "Book",
    "jason": "sweater",
    "chels": "iPad"​
//  }"
​
​// JSON.parse Examples 
 // The following is a JSON string, so we cannot access the properties with dot notation 
// (like christmasListStr.mike)​

​var christmasListStr = '{"mike":"Book","jason":"sweater","chels":"iPad"}';
​
​// Let’s convert it to an object​

​var christmasListObj = JSON.parse (christmasListStr); 
​
​///// Now that it is an object, we use dot notation​

console.log(christmasListObj.mike); // Book




