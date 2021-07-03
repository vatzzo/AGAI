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
import "@fortawesome/fontawesome-free/css/all";

// Navigation
  // TODO Move it to separate file
window.onload = function() {
  const elements = {
    links: document.querySelector('.header-links'),
    button: document.getElementById('btn')
  }

  elements.button.addEventListener('click', (e) => {
    elements.links.classList.toggle('header-links--unrolled');
    e.target.classList.toggle('fa-angle-up');
  });
}
