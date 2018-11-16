// app/javascript/plugins/flatpickr.js
import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // A path to the theme CSS

flatpickr(".datepicker", {
  enableTime: true,
  minDate: "today",
  altInput: true
});
