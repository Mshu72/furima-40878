const item_price = () => {
  const priceInput = document.getElementById('item-price');
  const taxDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  priceInput.addEventListener('input', () => {
    const price = parseInt(priceInput.value);
    if (isNaN(price)) {
      taxDisplay.textContent = 0;
      profitDisplay.textContent = 0;
      return;
    }

    const tax = Math.floor(price * 0.1); 
    const profit = Math.floor(price - tax);

    taxDisplay.textContent = tax;
    profitDisplay.textContent = profit;
  });
});

window.addEventListener('turbo:load', item_price);
window.addEventListener('turbo:render', item_price);