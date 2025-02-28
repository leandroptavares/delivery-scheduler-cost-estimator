import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="validation"
export default class extends Controller {
  static targets = [ "pickupAddressField", "pickupCityField", "pickupStateField", "pickupZipField", "pickupError", "deliveryAddressField", "deliveryCityField", "deliveryStateField", "deliveryZipField", "deliveryError", "weightField", "weightError", "dateField", "dateError" ]

  connect() {
    console.log("validation controller is here")
  }

  formValidation(event) {
    event.preventDefault()

    this.removeErrorStyles()
    let isFormValid = true

    if (this.pickupAddressFieldTarget.value == "" || this.pickupCityFieldTarget.value == "" || this.pickupStateFieldTarget.value == "" || this.pickupZipFieldTarget.value == "") {
      isFormValid = false

      this.pickupAddressFieldTarget.classList.add("border-red-400")
      this.pickupErrorTarget.classList.remove("hidden")

      const pickupComplementaryFields = [this.pickupCityFieldTarget, this.pickupStateFieldTarget, this.pickupZipFieldTarget]

      pickupComplementaryFields.forEach((field) => {
        if (field.value === "") {
          field.classList.add("border-red-400")
        }
      })

    }

    if (this.deliveryAddressFieldTarget.value == "" || this.deliveryCityFieldTarget.value == "" || this.deliveryStateFieldTarget.value == "" || this.deliveryZipFieldTarget.value == "") {
      isFormValid = false

      this.deliveryAddressFieldTarget.classList.add("border-red-400")
      this.deliveryErrorTarget.classList.remove("hidden")

      const deliveryComplementaryFields = [this.deliveryCityFieldTarget, this.deliveryStateFieldTarget, this.deliveryZipFieldTarget]

      deliveryComplementaryFields.forEach((field) => {
        if (field.value === "") {
          field.classList.add("border-red-400")
        }
      })
    }


    if (this.weightFieldTarget.value == "" || this.weightFieldTarget.value < 1) {
      isFormValid = false

      this.weightFieldTargetFieldTarget.classList.add("border-red-400")
      this.weightErrorTarget.classList.remove("hidden")

    }

    if (this.dateFieldTarget.value == "") {
      isFormValid = false

      this.dateFieldTargetFieldTarget.classList.add("border-red-400")
      this.dateErrorTarget.classList.remove("hidden")
    }

    if (!isFormValid) {
      return
    } else {
      event.target.submit()
    }
  }

  trackAddressChanges(event) {

    if (event.target === this.pickupAddressFieldTarget) {
      this.pickupCityFieldTarget.value = ""
      this.pickupStateFieldTarget.value = ""
      this.pickupZipFieldTarget.value = ""
      this.pickupErrorTarget.classList.add("hidden")

      const pickupFields = [this.pickupAddressFieldTarget, this.pickupCityFieldTarget, this.pickupStateFieldTarget, this.pickupZipFieldTarget]

      pickupFields.forEach((field) => {
        if (field.classList.contains("border-red-400")) {
          field.classList.remove("border-red-400")
        }
      })
    }

    if (event.target === this.deliveryAddressFieldTarget) {
      this.deliveryCityFieldTarget.value = ""
      this.deliveryStateFieldTarget.value = ""
      this.deliveryZipFieldTarget.value = ""
      this.deliveryErrorTarget.classList.add("hidden")

      const deliveryFields = [this.deliveryAddressFieldTarget, this.deliveryCityFieldTarget, this.deliveryStateFieldTarget, this.deliveryZipFieldTarget]

      deliveryFields.forEach((field) => {
        if (field.classList.contains("border-red-400")) {
          field.classList.remove("border-red-400")
        }
      })
    }
  }

  removeErrorStyles() {
    const fields = [this.pickupAddressFieldTarget, this.pickupCityFieldTarget, this.pickupStateFieldTarget, this.pickupZipFieldTarget, this.deliveryAddressFieldTarget, this.deliveryCityFieldTarget, this.deliveryStateFieldTarget, this.deliveryZipFieldTarget, this.weightFieldTarget, this.dateFieldTarget]

    fields.forEach((field) => {
      field.classList.remove("border-red-400")
    })
  }
}
