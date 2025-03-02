import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["message"]
  
  connect() {

  setTimeout(() => {
    this.messageTarget.classList.add("hidden");
  }, 4000);
}
}
