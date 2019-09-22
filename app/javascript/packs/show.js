const dropDownCheckIn = () => {
const checkins = document.querySelectorAll('.dropdown-checkin');
  checkins.forEach(checkin => {
    checkin.addEventListener('click', (event) => {
      const snapshot = event.target.querySelector('#snapshot');
        if (snapshot.style.display === "none") {
          snapshot.style.display = "block";
        } else {
          snapshot.style.display = "none";
        }
    })
  })
}
 dropDownCheckIn();
