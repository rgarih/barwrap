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


