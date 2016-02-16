function Vehicle(){}
Vehicle.prototype = {doors: 4, wheels: 4};

var sedan = new Vehicle();
var coupe = new Vehicle();

coupe.doors = 2;

function Coupe(){};
function Motorcycle(){};

Coupe.prototype = new Vehicle();
Motorcycle.prototype = new Vehicle();

var coupe = new Coupe();
var motorcycle = new Motorcycle();


//console.log(coupe instanceof Coupe);
//console.log(coupe instanceof Vehicle);
//console.log(motorcycle instanceof Motorcycle);
//console.log(motorcycle instanceof Vehicle);

function Sedan(){}
console.log(Vehicle.prototype);
Sedan.prototype = Object.create(Vehicle.prototype);

var sedan = new Sedan();

console.log(sedan instanceof Vehicle);
console.log(sedan instanceof Sedan);