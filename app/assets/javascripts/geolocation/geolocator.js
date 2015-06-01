var Geolocator = (function () {
    // Instance stores a reference to the Singleton
    var instance;

    function init() {
        // Singleton
        return geoObject();
    }

    return {
        // Get the Singleton instance if one exists
        // or create one if it doesn't
        coordinates: function () {
            if ( !instance ) {
                instance = init();
            }
            
            return instance;
        }
    };
})();

