import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
static targets = ["profile", "bookings", "gigs", "allActive", "allDNone", "allTabs"]


  switchTab(event) {
    // console.log(this.allActiveTargets);
    const tabs = this.allActiveTargets
    tabs.forEach((tab) => {
      console.log(tab.innerHTML);
      tab.classList.remove("active");
      if (tab === event.currentTarget) {
        tab.classList.add("active")
      }
    })


    // console.log(this.allDNoneTargets);
    const htmls = this.allDNoneTargets
    htmls.forEach((html) => {
      console.log(html.id);
      html.classList.add("d-none");
      console.log()
      if (html.id === event.currentTarget.innerHTML) {
        html.classList.remove("d-none")
      }
    })
  }
}
