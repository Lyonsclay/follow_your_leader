function getPosition() {
    return new Promise(function (resolve, reject) {
        navigator.geolocation.getCurrentPosition(resolve, reject);
    });
}
function getCoords(position) {
    return new Promise(function (resolve, reject) {
        resolve({
            longitude: position.coords.longitude,
            latitude: position.coords.latitude
        });
    });
}

function geolocate() {
    return getPosition().then(getCoords);
}

