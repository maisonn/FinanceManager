import flatpickr from "flatpickr"

document.addEventListener('turbolinks:load', function() {
    flatpickr('.flatpickr', {
      dateFormat: "Y-m-d",
    });
})

const startDateInput = document.getElementById('report_start_date');
const endDateInput = document.getElementById('report_end_date');


if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#flat-booking-dates').dataset.unavailable)
endDateInput.disabled = true

flatpickr(startDateInput, {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
});

console.log('im in the file')

startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};

