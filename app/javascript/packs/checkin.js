const CheckInFromNav = () => {
  const check = document.querySelector(".checkin-plus")
  check.addEventListener("click", (event) => {
   event.preventDefault();
    navigator.geolocation.getCurrentPosition((position) => {
    let lat = position.coords.latitude;
    let long = position.coords.longitude;

    console.log(lat);
    console.log(long);


    window.location = `/check_ins/new_checkin?lat=${lat}&long=${long}`;
  });

  });

}

CheckInFromNav();
