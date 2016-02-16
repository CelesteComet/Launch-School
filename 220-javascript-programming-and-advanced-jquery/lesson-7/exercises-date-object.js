// 1

var today = new Date();

// 2

//console.log("Today's day is " + today.getDay());

// 3

var days_of_week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
//console.log("Today's day is " + days_of_week[today.getDay()] );

// 4 and 5

function dateSuffix(numericDate) {
  // accepts a numeric week date and returns a formatted string  
  var lastDigit = numericDate % 10;
  if (lastDigit == 1) {return (numericDate + "st")}
  if (lastDigit == 2) {return (numericDate + "nd")}
  if (lastDigit == 3) {return (numericDate + "rd")}
  return numericDate + "th";  
}

//console.log("Today's date is " + days_of_week[today.getDay()] + ", the " + dateSuffix(today.getDay()) + "." ) ;


// 6 and 7

var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

//console.log("Today's date is " + days_of_week[today.getDay()] + ", " + months[today.getMonth()] + " " + dateSuffix(today.getDate()) );

// 8 

function formatMonth(numericMonth){
  // returns a formatted string for months
  var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  return months[numericMonth];
}

function formatWeekday(numericWeekday){
  // returns a formatted string for day of the week
  var days_of_week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  return days_of_week[numericWeekday];
}

function formatEverything(date){
  // pass in date object to return formatted string
  return "Today's date is " + formatWeekday(date.getDay()) + ", " + formatMonth(date.getMonth()) + " " + dateSuffix(date.getDate()) + ".";
}


// console.log( formatEverything(new Date()) )

// 9

function formatYear(date){
  // returns the year in number format!!
  return today.getYear() + 1900
}

// 10

// console.log(today.getFullYear());

// 11

// console.log(today.getTime());

// 12
var tomorrow = new Date(today);
tomorrow.setDate(16)
//console.log(formatEverything(tomorrow));


// 13

var next_week = new Date(today);
//console.log(next_week === today)

// 14

//console.log(next_week.toDateString() === today.toDateString());
next_week.setDate(today.getDate() + 7);
//console.log(next_week.toDateString() === today.toDateString());

// 15

function formatTime(date){
  return date.getHours() + ":" + date.getMinutes();
}

console.log(formatTime(today));



