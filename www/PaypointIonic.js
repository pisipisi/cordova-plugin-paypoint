var exec = require('cordova/exec');

var stringToArrayBuffer = function(str) {
    var ret = new Uint8Array(str.length);
    for (var i = 0; i < str.length; i++) {
        ret[i] = str.charCodeAt(i);
    }
    return ret.buffer;
};

var base64ToArrayBuffer = function(b64) {
    return stringToArrayBuffer(atob(b64));
};

function massageMessageNativeToJs(message) {
    if (message.CDVType == 'ArrayBuffer') {
        message = base64ToArrayBuffer(message.data);
    }
    return message;
}
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
    exec(success, error, 'PaypointIonic', 'isPayPointConnected');
};

exports.onPayPointConnected = function(success, error) {
    exec(success, error, 'PaypointIonic', 'onPayPointConnected');
};

exports.openDraw = function(success, error) {
    exec(success, error, 'PaypointIonic', 'openDraw');
};

exports.cashDrawStatus = function(success, error) {
    exec(success, error, 'PaypointIonic', 'cashDrawStatus');
};

exports.printAsync = function(printString, success, error) {
    exec(success, error, 'PaypointIonic', 'printAsync', [printString]);
};

exports.startDisplayCFDLine = function(line1, line2, success, error) {
    exec(success, error, 'PaypointIonic', 'startDisplayCFDLine',[line1, line2]);
};

exports.setCustomerDisplayBacklightOnOff = function(onOff, success, error) {
    exec(success, error, 'PaypointIonic', 'setCustomerDisplayBacklightOnOff', [onOff]);
};

exports.customerDisplayStopScroll = function(success, error) {
    exec(success, error, 'PaypointIonic', 'customerDisplayStopScroll');
};

exports.customerDisplayDecreaseLeftScrollSpeed = function(success, error) {
    exec(success, error, 'PaypointIonic', 'customerDisplayDecreaseLeftScrollSpeed');
};

exports.customerDisplayIncreaseLeftScrollSpeed = function(success, error) {
    exec(success, error, 'PaypointIonic', 'customerDisplayIncreaseLeftScrollSpeed');
};

exports.customerDisplayDecreaseRightScrollSpeed = function(success, error) {
    exec(success, error, 'PaypointIonic', 'customerDisplayDecreaseRightScrollSpeed');
};

exports.customerDisplayIncreaseRightScrollSpeed = function(success, error) {
    exec(success, error, 'PaypointIonic', 'customerDisplayIncreaseRightScrollSpeed');
};

exports.setBarCodeReaderOnOff = function(onOff, success, error) {
    exec(success, error, 'PaypointIonic', 'setBarCodeReaderOnOff', [onOff]);
};

exports.readBarCode = function(success, error) {
    exec(success, error, 'PaypointIonic', 'readBarCode');
}; 

exports.stopReadBarCode = function(success, error) {
    exec(success, error, 'PaypointIonic', 'stopReadBarCode');
}; 

exports.clearMSR = function(success, error) {
    exec(success, error, 'PaypointIonic', 'clearMSR');
};

exports.readMSR = function(success, error) {
    var successWrapper = function(data) {
        convertToNativeJS(data);
        success(data);
    };
    exec(successWrapper, error, 'PaypointIonic', 'readMSR');
};

exports.stopReadMSR = function(success, error) {
    exec(success, error, 'PaypointIonic', 'stopReadMSRData');
};

exports.checkPaperStatus = function(success, error) {
    exec(success, error, 'PaypointIonic', 'checkPaperStatus');
};

exports.hardwareVersion = function(success, error) {
    exec(success, error, 'PaypointIonic', 'hardwareVersion');
};
