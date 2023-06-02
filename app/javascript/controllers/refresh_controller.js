import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh"
export default class extends Controller {
  static values = { acceptUrl: String, denyUrl: String}
  static targets = ["btn", "status"]
  connect() {
    console.log(this.acceptUrlValue)
  }

  accept() {
    fetch(this.acceptUrlValue, {
      method: "GET", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" }
    })
    this.#erase()
    this.#update("validated")
  }

  deny() {
    fetch(this.denyUrlValue, {
      method: "GET", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" }
    })
    this.#erase()
    this.#update("refused")
  }

  #erase() {
    this.btnTarget.remove()
  }

  #update(status) {
    this.statusTarget.innerHTML = status
    this.statusTarget.classList.add( status )
  }
}
