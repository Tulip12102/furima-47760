const pay = () => {
  const form = document.getElementById('charge-form');
  if (!form) return;

  if (form.dataset.payjpInitialized === "true") return;
  form.dataset.payjpInitialized = "true";

  const publicKey = gon.public_key
  const payjp = Payjp(publicKey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    if (form.dataset.submitted === "true") return;
    form.dataset.submitted = "true";

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        console.log(response.error.message);
        form.dataset.submitted = "false";
        return;
      }

    const token = response.id;

    if (!token) {
        form.dataset.submitted = "false";
      return;
      }

      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token}" name='order_address[token]' type="hidden">`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);
