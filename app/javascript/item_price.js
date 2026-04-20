const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = Number(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax;

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });
};

document.addEventListener("turbo:load", price);
document.addEventListener("turbo:render", price);