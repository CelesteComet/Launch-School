// 1

function toDegrees(radians){
  return (radians * 180 / Math.PI);
}

// 2

var someValue = -180
// console.log(Math.abs(someValue));

// 3

// console.log(Math.sqrt(16777216));

// 4

// console.log(Math.pow(16,6))

function power(base, exponent) {
  if (exponent == 1) {return base}
  return base * power(base, exponent - 1)
}

// 5

var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a))
console.log(Math.ceil(b))
console.log(Math.round(c))

// 6

function getRandom(min,max){
  return Math.floor(Math.random() * (max - min)) + min;
}





