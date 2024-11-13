import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

export default class extends Controller {
  static targets = [ "salary", "inssDiscount" ]

  async calculate() {
    let salary = parseFloat(this.salaryTarget.value)

    if (isNaN(salary) || salary <= 0) {
      salary = 0.0;
    }

    try {
      const response = await post("/preponents/calculate_inss", {
        body: JSON.stringify({ salary: salary }),
        contentType: "application/json"
      });

      if (response.ok) {
        const data = await response.json;
        this.inssDiscountTarget.value = data.inss_discount.toFixed(2);
      } else {
        console.error("Erro ao calcular o desconto INSS:", response.statusText);
      }
    } catch (error) {
      console.error("Erro na requisição:", error);
    }
  }
}
