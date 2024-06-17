document.addEventListener('DOMContentLoaded', () => {
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

    const tax = Math.floor(price * 0.1); // 手数料は価格の10%
    const profit = price - tax;

    taxDisplay.textContent = tax;
    profitDisplay.textContent = profit;
  });
});

