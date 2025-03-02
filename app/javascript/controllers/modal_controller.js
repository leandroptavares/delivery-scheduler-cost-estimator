import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["addDeliveryForm", "pageBg"]

  showForm() {
    this.addDeliveryFormTarget.classList.remove("hidden")
    this.pageBgTarget.classList.add("opacity-25", "pointer-events-none")
  }

  closeForm() {
    this.addDeliveryFormTarget.classList.add("hidden")
    this.pageBgTarget.classList.remove("opacity-25", "pointer-events-none")
  }
}
