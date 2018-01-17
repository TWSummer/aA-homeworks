console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: "GET",
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=57bf9bc2d0fd75aaf3254acf8c6271f8",
  success(data) {
    console.log(data);
  },
  error() {
    console.log("An error occurred");
  }
});
// Add another console log here, outside your AJAX request
console.log("After the request");
