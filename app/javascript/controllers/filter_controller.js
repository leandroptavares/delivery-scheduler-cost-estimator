import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["filterFields", "filterToggle"]
  static values = { visible: Boolean }

  toggleFilters() {
    this.visibleValue = !this.visibleValue;
    this.toggleVisibility();
  }

  toggleVisibility() {
    if (this.visibleValue) {
      this.filterFieldsTarget.classList.remove("hidden")
      this.filterToggleTarget.textContent = "Hide filters"
    } else {
      this.filterFieldsTarget.classList.add("hidden")
      this.filterToggleTarget.textContent = "Show filters"
    }
  }
}
