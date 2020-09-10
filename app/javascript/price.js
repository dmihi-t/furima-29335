document.addEventListener("turbolinks:load", function() {
  const price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener('input', function(e) {
  add_tax_price.innerHTML = Math.floor((e.target.value) * 0.1)
  profit.innerHTML = Math.floor((e.target.value) * 0.9)
  })
})