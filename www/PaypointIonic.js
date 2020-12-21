var exec = require('cordova/exec');
function convertToNativeJS(object) {
    Object.keys(object).forEach(function (key) {
        var value = object[key];
        object[key] = massageMessageNativeToJs(value);
        if (typeof(value) === 'object') {
            convertToNativeJS(value);
        }
    });
}
exports.isPayPointConnected = function(success, error) {
    // var successWrapper = function(success) {
    //     convertToNativeJS(success);
    //     success(success);
    // };
    exec(success, error, 'PaypointIonic', 'isPayPointConnected');
};

exports.openDraw = function(success, error) {
    exec(success, error, 'PaypointIonic', 'openDraw');
};

