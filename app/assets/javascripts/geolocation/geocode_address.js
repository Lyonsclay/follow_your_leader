function geocodeAddress(location){
    return new Promise(function (resolve, reject) {
        var geocoder = new google.maps.Geocoder(),
        coordinates = new google.maps.LatLng(location.longitude, location.latitude),
        setting = { 'latLng': coordinates };
        
        geocoder.geocode(setting, function (results, status) {
            if (status === 'OK') {
                resolve(results[0].formatted_address);
            } else {
                reject(status);
            }
        });
    });
}

