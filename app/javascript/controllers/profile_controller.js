import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    this.updateFormDisplay()
  }

  updateFormDisplay() {
    this.formTargets.forEach((form) => {
      form.style.display = (form.dataset.profileType === this.selectedProfileType) ? 'block' : 'none'
    })
  }

  get selectedProfileType() {
    return this.element.querySelector('input[name="profileType"]:checked').value
  }
}
