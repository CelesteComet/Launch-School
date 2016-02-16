// 1

function NewArray(){}
NewArray.prototype = Object.create(Object.getPrototypeOf([]));
NewArray.prototype.first = function(){
  return this[0];
}


// 2

function SomeObj(){
  this.name = "gay object";
  this.log = function(){
    console.log(this.name);
  }
}

var obj = new SomeObj();
Object.defineProperties(obj, {name:{writable: false}});
obj.name = "not gay object";
console.log(obj.name);

// 3

var something = {
  number: 21,
  string: "Bruce",
  array: [1,2,3],
  _function: function(){
    console.log("Hello");
  }
}
console.log(something)
Object.freeze(something)
something.number = 100;
something.string = "alex";
something.array = ['a'];
something._function = function(){}
console.log(something.number)
console.log(something.string)
console.log(something.array);
console.log(something._function);


