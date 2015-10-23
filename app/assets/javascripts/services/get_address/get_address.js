function getAddress(coords) {
    return new Promise(function (resolve, reject) {
        var geocoder = new google.maps.Geocoder(),
            lat = coords.latitude,
            lng = coords.longitude,
            coordinates = new google.maps.LatLng(lat, lng),
            setting = { 'latLng': coordinates };
        
        geocoder.geocode(setting, function (results, status) {
            var address = results[0].formatted_address;
            if (status === 'OK') {
                resolve(address);
            } else {
                reject(status);
            }
        });
    });
}

