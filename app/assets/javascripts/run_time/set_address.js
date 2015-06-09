$('.new_voter_district').ready(setAddress);

function setAddress() {
    geolocate().then(getAddress).then(preFill);

    function preFill(address) {
        $('#voter_district_address').val(address);
    }
}
