// 1

var invoices = new Object();
invoices.foo = 130;
invoices.bar = 250;

// 2

var payments = {
  foo: 80,
  bar: 55
}

// 3

var payments_received = 0;
payments.foo -= invoices.foo;
payments.bar -= invoices.bar;
payments_received = payments.foo + payments.bar;

// 4

var remaining_due = 0;
for (prop in invoices) {
  remaining_due += invoices[prop];
}

// 5

var second_invoices = Object.create(invoices);
//console.log(second_invoices);
invoices.foo = 0
//console.log(second_invoices.foo);

// 6

var Invoices = {
  foo: 130,
  bar: 250
};

// 7

var outstanding_invoices = [];
outstanding_invoices.push(Object.create(Invoices));
outstanding_invoices.push(Object.create(Invoices));

// 8

Object.freeze(Invoices);
//console.log(Invoices.foo);
Invoices.foo = 0;
//console.log(Invoices.foo);

// 9

outstanding_invoices[0].foo = 0;
//console.log(outstanding_invoices[0].foo);

// 10

//console.log(Object.isFrozen(Invoices));
//console.log(Object.isFrozen(outstanding_invoices[0]));

// 11

function newInvoices(){
  return {foo: 130, bar: 250};
}
outstanding_invoices = [];
outstanding_invoices.push(newInvoices());
outstanding_invoices.push(newInvoices());

// 12

outstanding_invoices[0].foo = 0;
console.log(outstanding_invoices[0].foo);
console.log(outstanding_invoices[1].foo);

// 13

function newInvoices(foo,bar){
  return {
    foo: isNan(foo) ? 130 : foo,
    bar: isNan(bar) ? 250 : bar
  };
}

outstanding_invoices.push(newInvoices(undefined,400));

// 14

function newInvoices(clients){
  clients = clients || {};
  return {
    foo: (clients.foo || 130),
    bar: (clients.bar || 250)
  }
}

// 15

function newInvoices(clients){
  clients = clients || {};
  var invoices = {
    foo: (clients.foo || 130),
    bar: (clients.bar || 250)
  }
  invoices.getTotal = function(){
    return this.foo + this.bar
  }
  return invoices;
}

var invoice = newInvoices({foo: 250, bar: 200});
console.log(invoice.getTotal());
