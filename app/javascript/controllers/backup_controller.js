import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="backup"
export default class extends Controller {
  static targets = ["scrollBtn"];

  connect() {
    this.scrollBtnTarget.hidden = true;
  }

  scrollToTop() {
    window.scrollTo(0, 0);
  }

  controlBtn() {
    const footerHeight = document.querySelector(".footer").offsetHeight;
    const padding = 20;
    const minScrollDistance = 650;
    const maxScrollDistance =
      document.body.scrollHeight - window.screen.height - footerHeight;

    const maxPosY = footerHeight + padding;
    if (window.scrollY >= minScrollDistance) {
      this.scrollBtnTarget.hidden = false;
      this.element.style.bottom = `${padding}px`;
    } else {
      this.scrollBtnTarget.hidden = true;
    }

    if (window.scrollY >= maxScrollDistance) {
      this.element.style.bottom = `${maxPosY}px`;
    }
  }
}
