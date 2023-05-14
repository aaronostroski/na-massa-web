import { Controller } from "@hotwired/stimulus";
import Glide from '@glidejs/glide'
export default class extends Controller {
    connect() {
        setTimeout(() => {
            this.dismiss();
        }, 5000)
    }

    dismiss() {
        this.element.remove();
    }
}