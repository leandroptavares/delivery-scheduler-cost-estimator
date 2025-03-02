import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["filterFields", "filterToogle"]
  static isFilterVisible = false

  toogleFilters(event) {
    if (!this.constructor.isFilterVisible) {
      this.filterFieldsTarget.classList.remove("hidden")
      this.filterToogleTarget.textContent = "Hide filters"
      this.constructor.isFilterVisible = !this.constructor.isFilterVisible
    } else {
      this.filterFieldsTarget.classList.add("hidden")
      this.filterToogleTarget.textContent = "Show filters"
      this.constructor.isFilterVisible = !this.constructor.isFilterVisible
    }

  }
}
