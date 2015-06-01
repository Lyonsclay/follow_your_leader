var geoObject = function () {
    function success(position) {
        return {
            longitude: position.coords.longitude,
            latitude: position.coords.latitdue
        };
    }

    function error(err) {
        return err;
    }

    var geoLocation = navigator.geolocation.getCurrentPosition(success, error);

    return new Promise(function (resolve, reject) {
        resolve(geoLocation);
    });
};

