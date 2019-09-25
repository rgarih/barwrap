const dropDownCheckIn = () => {
  const checkins = document.querySelectorAll('.dropdown-checkin');
  checkins.forEach(checkin => {
    checkin.addEventListener('click', (event) => {
      const icon = checkin.querySelector('.fas');
      const snapshot = checkin.querySelector('.snapshot');
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
