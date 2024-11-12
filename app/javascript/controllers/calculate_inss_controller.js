import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "salary", "inssDiscount" ]

  calculate() {
    let salary = parseFloat(this.salaryTarget.value)

    if (isNaN(salary) || salary <= 0) {
      salary = 0.0;
    }

    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

    fetch('/preponents/calculate_inss', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify({ salary: salary }),
    })
      .then(response => response.json())
      .then(data => {
        this.inssDiscountTarget.value = data.inss_discount.toFixed(2)
      })
      .catch(error => {
        console.error('Error:', error)
      })
  }

  connect() {
    console.log("Connected!")

    if (this.salaryTarget) {
      this.salaryTarget.addEventListener('input', this.calculate.bind(this))
    }
  }

}
