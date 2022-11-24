import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="backup"
export default class extends Controller {
  scrollToTop() {
    window.scrollTo(0, 0);
  }
}
