import "bootstrap";
import Typed from 'typed.js';
const homeText = () => {
  new Typed('#landing-text', {
    strings: ["We’ve put together a way for you to get a live feed on bars and clubs near you!" ,"No more wondering where to go for a good time! We tailor bars based on YOU!"],
    typeSpeed: 50,
    loop: true
  });
}

 homeText();

const multiSelectRecommendedPage = () => {
const labels = document.querySelectorAll('.label-check');
  labels.forEach(label => {
    label.addEventListener('click', (event) => {
      event.stopPropagation();
      event.target.classList.toggle("active");
    })
  })
}


multiSelectRecommendedPage();
