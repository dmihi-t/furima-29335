window.addEventListener('load', function(){
  const price1 = document.getElementById("item-price")
  const price2 = document.getElementById("add-tax-price")
  const price3 = document.getElementById("profit")
  price1.addEventListener('input', function() {
  price2.innerHTML = Math.floor((price1.value) * 0.1)
  price3.innerHTML = Math.floor((price1.value) * 0.9)
  })
})