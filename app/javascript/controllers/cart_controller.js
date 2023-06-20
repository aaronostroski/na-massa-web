import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["overlay", "cartMenu"]

  close() {
    this.overlayTarget.classList.add("hidden")
    this.cartMenuTarget.classList.add("hide-cart-menu")
  }

  open() {
    this.overlayTarget.classList.remove("hidden")
    this.cartMenuTarget.classList.remove("hide-cart-menu")
  }
}