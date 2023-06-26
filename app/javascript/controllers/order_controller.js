import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["neighborhood", "city", "street"]

  searchAddressByCep(el) {
    const cep = el.srcElement.value;

    if(cep.length < 9) return false;
    
    fetch(`https://viacep.com.br/ws/${cep}/json/`)
    .then( res => res.json() )
    .then( ({erro, ...addressData}) => { if(!erro) this.setAddressData(addressData) })
    .catch( e => console.error(e))
  }

  setAddressData({bairro: neighborhood, localidade: city, logradouro: street}) {
    this.neighborhoodTarget.value = neighborhood
    this.cityTarget.value = city
    this.streetTarget.value = street
  }

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



