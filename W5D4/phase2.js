function titleize(array, callback) {
  arr2 = [];
  for (i=0; i<array.length; i++) {
    arr2.push(`Mx. ${array[i]} Jingleheimer Schmidt`);
  }
  for (i=0; i<arr2.length; i++) {
    callback(arr2[i]);
  }
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick)
}

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

Elephant.prototype.play = function() {
  console.log(`${this.name} is ${this.tricks[getRandomInt(this.tricks.length)]}!`);
}

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

// titleize(["Mary", "Steven", "Jose"], (name) => console.log(name));

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// charlie.trumpet();
// console.log(charlie.height);
// charlie.grow();
// console.log(charlie.height);

// console.log(charlie.tricks);
// charlie.addTrick("stealing visitors' wallets");
// console.log(charlie.tricks);

// charlie.play();

// Elephant.paradeHelper(charlie);
herd.forEach(Elephant.paradeHelper)
