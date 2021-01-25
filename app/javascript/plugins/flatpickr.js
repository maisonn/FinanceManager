import flatpickr from "flatpickr"

document.addEventListener('turbolinks:load', function() {
    flatpickr('.flatpickr', {
      minDate: "today",
      dateFormat: "Y-m-d",
    });
})

