var getAddress = (function () {
    var instance;

    function init() {
        return geocodeAddress();
    }

    return {
        address: function () {
            if ( !instance ) {
                instance = init();
            }

            return instance;
        }
    };
})();
