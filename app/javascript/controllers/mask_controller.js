import {Controller} from "@hotwired/stimulus";
import IMask from "imask";

export default class extends Controller {
    static values = {
        params: {type: Object, default: {}}
    }

    connect() {
      IMask(this.element, {...this.element.dataset, ...this.paramsValue});
    }
}



