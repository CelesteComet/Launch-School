// 1

var total = 50;

function incrementBy(n){
  total += n;
}
//console.log(total);
incrementBy(15);
//console.log(total);

// 2

var total = 50;
function incrementBy(n){
  total = 0
  total += n;
}
//console.log(total)
incrementBy(15);
//console.log(total);

// 3

var total = 50;
var increment = 15;

function incrementBy(increment){
  total += increment;
}
//console.log(total);
incrementBy(increment);
//console.log(total);
incrementBy();
//console.log(total);

// 4

var fruit = 'apple';

var setFruitType = function(){
  var fruit = 'banana';
}
//console.log(fruit);
setFruitType();
//console.log(fruit);

// 5

var groceries = {
  banana: 2,
  apple: 3
}

function getTotal(items){
  var total = 0;
  for (value in items){
    total += items[value];
  }
  items.total = total;
}

getTotal(groceries);
//console.log(groceries.total)

// 6

var temperatures = [53, 86, 12, 43];
function removeLastTemperature(array){
  array.pop();
}
//removeLastTemperature(temperatures)
//console.log(temps);

// 7

function average(values){
  var total = 0;
  values.forEach(function(value){
    total += value;
  })
  return total/values.length
}

//console.log(average(temperatures));

// 8

function average() {
  var total = 0;

  for (var i = this.length - 1; i >= 0; i--) {
    total += this[i];
  }

  return total / this.length;
}

// 9

//console.log(average(temperatures));
//console.log(average.call(temperatures));
//console.log(average.apply(temperatures));

// 10


function averageTemperature(){
  var total = 0;

  for (var i = this.length - 1; i >= 0; i--) {
    total += this[i];
  }

  return total / this.length;
}

// 11

temperatures.push(115);

var averageTemperature = averageTemperature.bind(temperatures)

//console.log(averageTemperature());


// 12

temperatures.average = averageTemperature;
console.log(temperatures.average());