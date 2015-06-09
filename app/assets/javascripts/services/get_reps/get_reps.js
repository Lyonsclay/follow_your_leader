function getReps(address) {
    var electionId = 2000,
    repsRequest = gapi.client.request({
        'path': '/civicinfo/v2/representatives/',
        'params': { 'electionId': electionId,
                    'address': address }
    });
    return repsRequest;
}

