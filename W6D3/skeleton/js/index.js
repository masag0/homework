console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(weather) {
    console.log(weather);
  },
  error() {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
console.log("THE AJAX has been dispatched.");
