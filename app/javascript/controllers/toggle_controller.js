import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    toggle(event) {
        const btn_toggle = event.currentTarget;
        const span_toggle = btn_toggle.querySelector('.toggle-span');
        const input_toggle = btn_toggle.querySelector('input');
  
        if(this.is_switched(btn_toggle)) {
            input_toggle.value = false;
        } else {
            input_toggle.value = true;
        }

        this.handle_classes(btn_toggle, "bg-primary-600", "bg-gray-200")
        this.handle_classes(span_toggle, "translate-x-5", "translate-x-0")
    }

    is_switched(element) {
        return element.classList.contains('bg-primary-600');
    }

    handle_classes(element, class1, class2) {
        element.classList.toggle(class1)
        element.classList.toggle(class2)
    }
}