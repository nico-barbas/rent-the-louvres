import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-display"
export default class extends Controller {
  static targets = ["rating"];

  connect() {
    const value = parseInt(this.ratingTarget.dataset.reviewValue, 10);
    console.log(value)
    this.#insertStars(value)
  }

  #insertStars(value) {
    this.ratingTarget.innerHTML = value;
    switch(value) {
      case 0:
        const html =  "<div><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i></div>"
        this.ratingTarget.innerHTML = html
        break;
      case 1:
        const html1 =  "<div><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i></div>"
        this.ratingTarget.innerHTML = html1
        break;
      case 2:
        const html2 =  "<div><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i></div>"
        this.ratingTarget.innerHTML = html2
        break;
      case 3:
        const html3 =  "<div><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i><i class='fa-regular fa-star'></i></div>"
        this.ratingTarget.innerHTML = html3
        break;
      case 4:
        const html4 =  "<div><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-regular fa-star'></i></div>"
        this.ratingTarget.innerHTML = html4
        break;
      case 5:
        const html5 =  "<div><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i><i class='fa-solid fa-star'></i></div>"
        this.ratingTarget.innerHTML = html5
    }
  }
}
