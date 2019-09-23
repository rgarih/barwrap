const dropDownCheckIn = () => {
  const checkins = document.querySelectorAll('.dropdown-checkin');
  checkins.forEach(checkin => {
    checkin.addEventListener('click', (event) => {
      // console.log(event.target);
      const icon = checkin.querySelector('.fas');
      const snapshot = checkin.querySelector('.snapshot');
      console.log(checkin);
      console.log(icon);
      console.log(snapshot);
      if (snapshot.style.display === "none") {
        snapshot.style.display = "block";
        icon.style.display = 'none';
      } else {
        snapshot.style.display = "none";
        icon.style.display = 'block';
      }
    })
  })
}
 dropDownCheckIn();
