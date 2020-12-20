var exec = require('cordova/exec');

exports.openDraw = function(success, error) {
    exec(success, error, 'PaypointIonic', 'openDraw');
};

