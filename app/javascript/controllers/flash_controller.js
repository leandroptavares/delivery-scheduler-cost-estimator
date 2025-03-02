import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]


  connect() {
  console.log("the flash")

  setTimeout(() => {
    console.log("removing the element")
    this.messageTarget.classList.add("hidden");
  }, 4000);
}
}
