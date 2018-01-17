/* jshint esversion: 6 */

function View($el) {
  this.$el = $el;
  this.setupEasel();
}

function Color() {
  this.red = Math.random()*256;
  this.green = Math.random()*256;
  this.blue = Math.random()*256;
}

Color.prototype.to_s = function() {
  num = Math.floor(this.red) * 256**2 + Math.floor(this.green) * 256 + Math.floor(this.blue);
  str = num.toString(16);
  if (this.red < 16) {
    str = "0" + str;
  }
  return "#" + str;
};

Color.prototype.update = function() {
  changeAmt = 30;
  this.red += Math.random() * changeAmt - changeAmt / 2;
  this.green += Math.random() * changeAmt - changeAmt / 2;
  this.blue += Math.random() * changeAmt - changeAmt / 2;
  if (this.red < 1) {
    this.red = 1;
  }
  if (this.green < 0) {
    this.green = 0;
  }
  if (this.blue < 0) {
    this.blue = 0;
  }
  if (this.red >255) {
    this.red = 255;
  }
  if (this.green >255) {
    this.green = 255;
  }
  if (this.blue >255) {
    this.blue = 255;
  }
};

const colr = new Color;

window._randomColorString = function(){
  return '#' + Math.random().toString(16).substr(-6);
};

View.prototype.exercise0 = function () {
  //Challenge: (example) remove the 'square' class from every li
  //Result: this should cause the grid to turn into a long list of undecorated lis
  //just a list of dots

  //this one completed as an example :) no additional code necessary
  $('li').removeClass("square");
};

View.prototype.exercise1 = function () {
  //Challenge: Give every square the class 'orange'
  //Result: Every square should turn orange (we already have a CSS rule)
  $('.square').addClass("orange");
  //your code here!
};

View.prototype.exercise2 = function () {
  //Challenge: Remove every square
  //Result: Every square vanishes
  $('.square').remove();
  //your code here!
};

View.prototype.exercise3 = function () {
  //Challenge: Add an <h1> with the text 'i love jquery' under the grid.
  //Result: An <h1> with the text 'i love jquery' appears under the grid.
  $h1 = $("<h1>i love jquery</h1>");
  $body = $("body");
  $body.append($h1)
  //your code here!
};

View.prototype.exercise4 = function () {
  //Challenge: Write your first name in every other square.
  //Result: Your name appears in every other square.
  $li = $('li:odd')
  // $me = $("<p>Theo</p>");
  $li.text("Theo");
  //your code here!
};

View.prototype.exercise5 = function () {
  //Challenge: Alert the row and column of the square, when the square is clicked.
  //Result: When a square is clicked, the row and column appear in an alert. for
  //example: clicking the top left square should alert '0, 0'.

  //hint: checkout the addRow function at the bottom of the file: we set the
  //  'data-pos' of every square
  $li = $('li');
  $li.on("click", squareAlert);

  function squareAlert(event) {
    // alert("Alert!!!!!!!");
    $target = $(event.currentTarget);
    alert(`${$target.data('pos')}`);
  }
  //your code here!
};

View.prototype.exercise6 = function () {
  //Challenge: Give every square a random color!
  //Result: Every square becomes a color as soon as this code runs. The grid
  //should become a beautiful rainbow of colors.

  //hint: use window._randomColorString() (defined at top) to get a random color!
$li = $('li');
$li.each(function() {
  $(this).css("background-color", window._randomColorString());
})
  //your code here!
};

View.prototype.exercise7 = function(){
  //Challenge: When your mouse goes over a square, console log its color.
  //Result: When the mouse goes over a square its color should appear in the
  //console. The color won't be the color's name, but its rbg value.
  //You should push the button for exercise 6 first to try it on the
  //rainbow.
  $li = $('li');
  $li.on("mouseover", logColor);

  function logColor(event) {
    // alert("Alert!!!!!!!");
    $target = $(event.currentTarget);
    console.log(`${$target.css("background-color")}`);
    // $(this).css("background-color");
    // alert(`${$target.data('pos')}`);
  }
  //your code here!
};



View.prototype.setupEasel = function() {
  const $addRowButton = $('<button>').html('Add a row');
  this.$el.append($addRowButton);
  $addRowButton.on("click", this.addRow.bind(this));

  for(let j = 0; j <= 7; j++){
    const $button = $("<button>").html("Exercise " + j);
    $button.on("click", this["exercise" + j]);
    this.$el.append($button);
  }

  for(let i = 0; i < 20; i ++) {
    this.addRow();
  }
};

View.prototype.addRow = function() {
  const rowIdx = this.$el.find(".row").length;
  const $row = $("<ul>").addClass("row").addClass("group");
  for(let colIdx = 0; colIdx < 20; colIdx++) {
    const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);
    $square.on("mouseenter", (e) => {
      const $square = $(e.currentTarget);
      colr.update()
      $square.css("background-color", colr.to_s());
      console.log(colr.to_s());
    });
    $row.append($square);
  }
  this.$el.append($row);
};

module.exports = View;
