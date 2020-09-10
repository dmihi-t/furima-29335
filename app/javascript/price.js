window.addEventListener("load", function() {
  const price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener('input', function() {
  add_tax_price.innerHTML = Math.floor((price.value) * 0.1)
  profit.innerHTML = Math.floor((price.value) * 0.9)
  })
})