var exec = require('cordova/exec');

exports.openDraw = function(arg0, success, error) {
    exec(success, error, 'PaypointIonic', 'openDraw', [arg0]);
};

