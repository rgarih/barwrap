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
  // checkins.forEach(checkin => {
  //   checkin.addEventListener('click', (event) => {
  //     // console.log(event.target);
  //     const icon = checkin.querySelector('.fas');
  //     const snapshot = checkin.querySelector('.snapshot');
  //     console.log(checkin);
  //     console.log(icon);
  //     console.log(snapshot);
  //     if (snapshot.style.display === "none") {
  //       snapshot.style.display = "block";
  //       icon.style.display = 'none';
  //     } else {
  //       snapshot.style.display = "none";
  //       icon.style.display = 'block';
  //     }
  //   })
  // })
}
 dropDownCheckInIcon();
