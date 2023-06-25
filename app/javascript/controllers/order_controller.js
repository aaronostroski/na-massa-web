import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  toggleCollapsible(el) {
    const sectionId = el.srcElement.dataset.sectionId;  
    const collapsible = document.querySelector(`#${sectionId} .collapsible`);

    collapsible?.classList?.toggle('max-h-full')

    const arrowDown = document.querySelector(`#${sectionId} .down`);
    const arrowUp = document.querySelector(`#${sectionId} .up`);

    arrowDown?.classList?.toggle('hidden')
    arrowUp?.classList?.toggle('hidden')
  }
}



