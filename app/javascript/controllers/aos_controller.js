import { Controller } from "@hotwired/stimulus";
import AOS from "aos";

export default class extends Controller {
  connect() {
    console.log("test")
    AOS.init({ disableMutationObserver: false });
  }

  disconnect() {
    const animatesClass = document.querySelectorAll(".aos-init, .aos-animate");
    animatesClass.forEach(el => {
      el.classList.remove('aos-init')
      el.classList.remove('aos-animate')
    })
  }
}