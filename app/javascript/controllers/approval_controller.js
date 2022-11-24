import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="approval"
export default class extends Controller {
  connect() {
    console.log("approval controller connected");
  }

  updateStatus() {
    setTimeout(() => {
      this.element.innerText = "Approved";
    }, 10000);
  }

  notification() {
    setTimeout(() => {
      this.element.classList.remove("opacity-0");
    }, 10000);
  }
}
