document.addEventListener('turbolinks:load', () => {
  let elements = {
    links: document.querySelector('.header-links'),
    button: document.getElementById('btn')
  }

  elements.links.classList.remove('header-links--unrolled');
  elements.button.classList.remove('fa-angle-up');

  elements.button.addEventListener('click', (e) => {
    elements.links.classList.toggle('header-links--unrolled');
    e.target.classList.toggle('fa-angle-up');
    console.log('works')
  });
});
