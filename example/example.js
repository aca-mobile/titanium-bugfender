var Bugfender = require('be.aca.mobile.bugfender');

Bugfender.init({
    applicationToken: "yourApplicationToken",
    debug: true
});

Bugfender.enableCrashReporting();
Bugfender.enableUIEventLogging();

if (OS_ANDROID) {
    Bugfender.enableLogcatLogging();
    Bugfender.disableReflection(true);
} else {
    Bugfender.setPrintToConsole(true);
}

Bugfender.forceSendOnce();
Bugfender.setForceEnabled(true);
Bugfender.setMaximumLocalStorageSize(1024*1024);


if (OS_ANDROID) {
    console.log(Bugfender.getDeviceUrl());
}
console.log(Bugfender.deviceUrl);

if (OS_ANDROID) {
    console.log(Bugfender.getSessionUrl());
}
console.log(Bugfender.sessionUrl);

if (OS_IOS) {
    console.log(Bugfender.appKey);
    console.log(Bugfender.forceEnabled);
    console.log(Bugfender.maximumLocalStorageSize);
    console.log(Bugfender.printToConsole);
}

Bugfender.setDeviceBoolean({
    key: "boolKey",
    value: true
});

Bugfender.setDeviceDouble({
    key: "doubleKey",
    value: 12.345
});

Bugfender.setDeviceInteger({
    key: "integerKey",
    value: 12345
});

Bugfender.setDeviceString({
    key: "stringKey",
    value: "stringValue"
});

Bugfender.removeDeviceKey("integerKey");

console.log(Bugfender.sendCrash({
    title: "Title",
    text: "Message"
}));

console.log(Bugfender.sendIssue({
    title: "Title",
    text: "Message"
}));

console.log(Bugfender.sendUserFeedback({
    title: "Title",
    message: "Message"
}));

Bugfender.d({
    tag: "default - d",
    message: "Default - Hello world!"
});

Bugfender.e({
    tag: "error",
    message: "Error - Hello world!"
});

Bugfender.f({
    tag: "default - f",
    message: "Default - Hello world!"
});

Bugfender.i({
    tag: "default - i",
    message: "Default - Hello world!"
});

Bugfender.t({
    tag: "default - t",
    message: "Default - Hello world!"
});

Bugfender.w({
    tag: "warning",
    message: "Warning - Hello world!"
});

Bugfender.logDefault({
    lineNumber: 1,
    method: "exampleMethod",
    file: "index.js",
    tag: "defaultTest",
    message: "Test message for default!"
});

Bugfender.logWarning({
    lineNumber: 2,
    method: "exampleMethod",
    file: "index.js",
    tag: "warningTest",
    message: "Test message for warning!"
});

Bugfender.logError({
    lineNumber: 3,
    method: "exampleMethod",
    file: "index.js",
    tag: "errorTest",
    message: "Test message for error!"
});

function _checkFeedbackResult(e) {
    if ((OS_ANDROID && _.isEqual(e.resultCode, Ti.Android.RESULT_OK)) || (OS_IOS && _.isEqual(e.feedbackSent, true))) {
        console.log("Feedback sent");
    } else {
        console.log("Feedback not sent");
    }
}

function _onOpenFeedbackDialogClicked() {
    if (OS_ANDROID) {
        /*#######################
        !! READ DOCUMENTATION TO AVOID TiRHelper$ResourceNotFoundException !!
        Styling: /app/platform/android/res/values/styles.xml

        <?xml version="1.0" encoding="utf-8"?>
        <resources>
            <color name="feedbackAppBarBackgroundColor">#2A5246</color>
            <color name="feedbackAppBarTitleColor">#FFFFFF</color>
            <color name="feedbackAppBarCloseButtonColor">#FFFFFF</color>
            <color name="feedbackAppBarActionButtonColor">#FFFFFF</color>

            <color name="feedbackScreenBackgroundColor">#2A5246</color>
            <color name="feedbackScreenTextColor">#FFFFFF</color>

            <color name="feedbackInputBackgroundColor">#BFCBC7</color>
            <color name="feedbackInputTextColor">#000000</color>
            <color name="feedbackInputHintColor">#FFFFFF</color>
        </resources>
        #########################
         */

        var intent = Bugfender.getUserFeedbackActivityIntent({
            title: "Title",
            hint: "Hint",
            subjectHint: "SubjectHint",
            messageHint: "MessageHint",
            sendButtonText: "sendButtonText",
            customActionBarColors: true,
            customScreenColors: true,
            customInputColors: true
        });

        Ti.Android.currentActivity.startActivityForResult(intent, _checkFeedbackResult);
    } else {
        Bugfender.showUserFeedbackViewController({
            title: "Title",
            hint: "Hint",
            subjectHint: "Subject",
            messageHint: "Message",
            sendButtonText: "Send",
            cancelButtonText: "Cancel",
            feedbackSentCallback: _checkFeedbackResult,
            styling: {
                mainStyling: {
                    mainBackgroundColor: "#2A5246",
                    secondaryBackgroundColor: "#BFCBC7"
                },
                hintStyling: {
                    hintFont: "Chalkduster",
                    hintFontSize: 30,
                    hintFontColor: "#FFFFFF"
                },
                subjectStyling: {
                    subjectFont: "Copperplate",
                    subjectFontSize: 15,
                    subjectFontColor: "#000000",
                    subjectPlaceholderFontColor: "#FFFFFF"
                },
                messageStyling: {
                    messageFont: "Courier New",
                    messageFontSize: 15,
                    messageFontColor: "#000000",
                    messagePlaceholderFontColor: "#FFFFFF"
                }
            }
        });
    }
}

var window = Ti.UI.createWindow();
var button = Ti.UI.createButton({
    title: "Open feedback dialog"
});

button.addEventListener('click', _onOpenFeedbackDialogClicked);

window.add(button);
window.open();