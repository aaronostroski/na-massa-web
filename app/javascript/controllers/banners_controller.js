import { Controller } from "@hotwired/stimulus";
import Glide from '@glidejs/glide'

export default class extends Controller {
  static glideCarrousel;

  connect() {
    this.glideCarrousel = new Glide('.glide', this.getCarrouselConfig() );
    this.glideCarrousel.mount()
  }

  getCarrouselConfig() {
    return {
      type: 'carousel',
      animationDuration: 2000,
      autoplay: 3000,
      hoverpause: true,
      focusAt: '1',
      startAt: 0,
      perView: 1, 
    }
  }
}