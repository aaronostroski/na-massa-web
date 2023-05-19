import { Controller } from "@hotwired/stimulus";
import SlimSelect from "slim-select";

export default class extends Controller {
  static targets = ["input"];
  connect() {
    const elementOptions = JSON.parse(
      this.inputTarget.dataset?.slimOptions || "{}"
    );

    new SlimSelect({
      select: this.inputTarget,
      placeholder: "Escolha...",
      searchText: "Nenhum resultado...",
      searchPlaceholder: "Pesquise...",
      addToBody: true,
      allowDeselect: true,
      ...elementOptions,
    });
  }
}
