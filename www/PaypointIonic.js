var exec = require('cordova/exec');

exports.isPayPointConnected = function(success, error) {
    exec(success, error, 'PaypointIonic', 'isPayPointConnected');
};

exports.openDraw = function(success, error) {
    exec(success, error, 'PaypointIonic', 'openDraw');
};

