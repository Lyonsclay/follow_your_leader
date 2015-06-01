function setCoordinates(location) {
    longitude = document.getElementById("voter_district_longitude");
    latitude = document.getElementById("voter_district_longitude");
    longitude.value = location.longitude;
    latitude.value = location.latitude;
    return location;
}


