// set the Mocha test interface
// see http://mochajs.org/#interfaces
mocha.ui('bdd');

// ignore the following globals during leak detection
// mocha.globals(['YUI']);

// or, ignore all leaks
mocha.ignoreLeaks();

// set slow test timeout in ms
mocha.timeout(1200);

// Show stack trace on failing assertion.
chai.config.includeStack = true;

//var chai = require("chai");
//var chaiAsPromised = require("chai-as-promised");

//chai.use(chaiAsPromised);
