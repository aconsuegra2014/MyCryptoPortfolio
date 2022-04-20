// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { ready } from "./utils.mjs";
import Choices from "choices.js";



Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")


var supportedCoins = {
    'BCH': 'bitcoin-cash',
    'ADA': 'cardano'
}

ready(event => {
    let transactionTags = document.querySelector("#transaction_tag_list")
        
    const choices =  transactionTags ? new Choices(transactionTags, { removeItemButton: true }) : null;
      
    let url = new URL('https://api.coingecko.com/api/v3/simple/price');
    url.search = new URLSearchParams({
        ids: 'cardano,bitcoin-cash',
        vs_currencies: 'usd'
    });

    if (document.querySelector("#crypto-resume") != null)
        fetch(url)
            .then(response => {
                if (response.ok)
                    return response.json();
            })
            .then(jsonObject => {
                document.querySelectorAll("#crypto-resume span.fiat-value").forEach(item => {
                    let parent = item.parentNode;

                    let fiatValue = item.dataset.amount * jsonObject[supportedCoins[item.id]].usd;

                    let fiatSpent = parent.dataset.fiatSpent;

                    item.innerText = fiatValue.toFixed(2);

                    let profitLost = fiatValue - fiatSpent;
                    parent.querySelector("span.profit-lost").innerText = profitLost.toFixed(2);

                })
            })
            .catch(reason => {
                console.log(reason);
            })
});