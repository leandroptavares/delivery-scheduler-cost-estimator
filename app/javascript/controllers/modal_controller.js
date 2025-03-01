import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["addDeliveryForm", "pageBg"]

  connect() {
    console.log("modal is here")
  }

  showForm() {
    console.log("show form")

    this.addDeliveryFormTarget.classList.remove("hidden")
    this.addDeliveryFormTarget.classList.add("opacity-100")
    this.pageBgTarget.classList.add("opacity-25")
  }
}
