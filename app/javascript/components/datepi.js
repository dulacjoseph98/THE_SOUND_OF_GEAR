const flatpickr = require("flatpickr");
const dateChoice = () => {
  const datep = document.querySelector(".flatpickr");
  flatpickr(datep, {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
}
export { dateChoice };
dateChoice();