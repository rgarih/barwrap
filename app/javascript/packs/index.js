const dropDownCheckInIcon = () => {
  const icons = document.querySelectorAll('.fa-camera');
  icons.forEach(icon => {
    icon.addEventListener('click',(event) =>{
      const colEleven = icon.parentNode.parentNode.firstChild.nextSibling.nextSibling.nextSibling
      colEleven.querySelector('.dropdown-checkin')
      const iconDots = colEleven.querySelector('.fas');
      const snapshot = colEleven.querySelector('.snapshot');
      if (snapshot.style.display === "none") {
        snapshot.style.display = "block";
        iconDots.style.display = 'none';
      } else {
        snapshot.style.display = "none";
        iconDots.style.display = 'block';
      }
    })
  })
}
 dropDownCheckInIcon();
