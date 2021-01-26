import flatpickr from "flatpickr"

document.addEventListener('turbolinks:load', function() {
  flatpickr('.flatpickr', {
    altInput: true,
    dateFormat: "Y-m-d",
  });
}) 


