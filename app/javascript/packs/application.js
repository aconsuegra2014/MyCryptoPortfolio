// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

var supportedCoins = {
    'BCH': 'bitcoin-cash',
    'ADA': 'cardano'
}

let url = new URL('https://api.coingecko.com/api/v3/simple/price');
url.search = new URLSearchParams({
    ids: 'cardano,bitcoin-cash',
    vs_currencies: 'usd'
});

fetch(url)
  .then( response => {
      if(response.ok)
      return  response.json();
  })
  .then( jsonObject => {
      document.querySelectorAll("#crypto-resume span.fiat-value").forEach( item => {
          let parent = item.parentNode;

          let fiatValue = item.dataset.amount * jsonObject[supportedCoins[item.id]].usd;

          let fiatSpent = parent.dataset.fiatSpent;

          item.innerText = fiatValue.toFixed(2);

          let profitLost = fiatValue - fiatSpent;
          parent.querySelector("span.profit-lost").innerText =  profitLost.toFixed(2);
          
      })
  })
  