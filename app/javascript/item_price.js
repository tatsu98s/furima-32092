window.addEventListener('input', () => {

const priceInput = document.getElementById("item-price");
 
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1 ));

  const takingPrice = document.getElementById("profit");
  takingPrice.innerHTML = (inputValue-(Math.floor(inputValue * 0.1 )));

})