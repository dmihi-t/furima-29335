// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.addEventListener('load', function(){
  const price1 = document.getElementById("item-price")
  const price2 = document.getElementById("add-tax-price")
  const price3 = document.getElementById("profit")
  price1.addEventListener('input', function() {
  price2.innerHTML = Math.floor((price1.value) * 0.1)
  price3.innerHTML = Math.floor((price1.value) * 0.9)
  })
})