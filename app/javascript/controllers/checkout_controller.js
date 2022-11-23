import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="checkout"
export default class extends Controller {
  static targets = ["startDate", "endDate", "totalPrice", "pricePerDay"];

  connect() {
    console.log("Checkout");
  }

  updatePrice() {
    const pricePerDay = parseInt(this.pricePerDayTarget.innerText);
    const start = this.startDateTargets;
    const end = this.endDateTargets;

    const startYear = start[0].options[start[0].selectedIndex].value;
    const startMonth = start[1].options[start[1].selectedIndex].value;
    const startDay = start[2].options[start[2].selectedIndex].value;
    const startDate = new Date(
      parseInt(startYear),
      parseInt(startMonth) - 1,
      parseInt(startDay)
    );

    const endYear = end[0].options[end[0].selectedIndex].value;
    const endMonth = end[1].options[end[1].selectedIndex].value;
    const endDay = end[2].options[end[2].selectedIndex].value;
    const endDate = new Date(
      parseInt(endYear),
      parseInt(endMonth) - 1,
      parseInt(endDay)
    );

    const timeDiff = (endDate - startDate) / 86400000;
    const newPrice = timeDiff * pricePerDay;

    this.totalPriceTarget.innerHTML = `Total price: <strong>${newPrice}$</strong>`;
  }
}
