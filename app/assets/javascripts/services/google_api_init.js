function setKey(key) {
    gapi.client.setApiKey(key);
}

function googleApiInit() {
    var  key = document.getElementsByName('google-api-key')[0].content;
    return singleRequest(setKey, key);
}

// gapi.client.load(API_NAME, API_VERSION, CALLBACK).then(makeRequest);
