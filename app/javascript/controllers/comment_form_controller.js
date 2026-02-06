import { Controller } from "@hotwired/stimulus"

// Toggles the visibility of the comment form on the post show page
export default class extends Controller {
  static targets = ["form"]

  connect() {
    if (this.hasFormTarget) {
      this.formTarget.classList.add("is-hidden")
    }
  }

  toggle() {
    if (!this.hasFormTarget) return
    this.formTarget.classList.toggle("is-hidden")
  }
}


