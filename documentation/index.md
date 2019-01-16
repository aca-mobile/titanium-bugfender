# Documentation
In this documentation, you can find the **complete API** of the module and the instructions on how to use the **default user feedback screen**.

For more samples, please check the native SDK samples:
* iOS: https://github.com/bugfender/BugfenderSDK-iOS
* Android: https://github.com/bugfender/BugfenderSDK-android-sample
## API
### Methods
* `d(args);`
    * `tag` (String)
    * `message` (String)
* `disableReflection(disable);` **(Android only)**
    * `disable` (Boolean)
* `e(args);`
    * `tag` (String)
    * `message` (String)
* `enableCrashReporting();`
* `enableLogcatLogging();` **(Android only)**
* `enableUIEventLogging();`
* `f(args);`
    * `tag` (String)
    * `message` (String)
* `forceSendOnce();`
* `getDeviceIdentifier();` **(Android only)** - See _properties_ for iOS/Android property
* `getSessionIdentifier();` **(Android only)** - See _properties_ for iOS/Android property
* `getUserFeedbackActivityIntent(args);` -> `Ti.Android.Intent` **(Android only)** _iOS alternative: showUserFeedbackViewController(args);_
    * `title` (String)
    * `hint` (String)
    * `subjectHint` (String)
    * `messageHint` (String)
    * `sendButtonText` (String)
    * `customActionBarColors` (Boolean)
    * `customScreenColors` (Boolean)
    * `customInputColors` (Boolean)
* `i(args);`
    * `tag` (String)
    * `message` (String)
* `init(args);`
    * `applicationToken` (String) **(Required)**,
    * `debug` (Boolean) **(Android only)**
* `logDefault(args);`
    * `lineNumber` (Integer),
    * `method` (String)
    * `file` (String)
    * `tag` (String)
    * `message` (String)
* `logWarning(args);`
    * `lineNumber` (Integer),
    * `method` (String)
    * `file` (String)
    * `tag` (String)
    * `message` (String)
* `logError(args);`
    * `lineNumber` (Integer),
    * `method` (String)
    * `file` (String)
    * `tag` (String)
    * `message` (String)
* `removeDeviceKey(key);`
    * `key` (String)
* `sendIssue();` -> `String`
    * `title` (String)
    * `text` (String)
* `sendUserFeedback(args);` -> `String` **(Returns a String on Android only)**
    * `title` (String)
    * `message` (String)
* `setApiUrl(url);` 
    * `url` (String)
* `setDeviceBoolean(args);`
    * `key` (String)
    * `value` (Boolean)
* `setDeviceDouble(args);`
    * `key` (String)
    * `value` (Double)
* `setDeviceInteger(args);`
    * `key` (String)
    * `value` (Integer)
* `setDeviceString(args});`
    * `key` (String)
    * `value` (String)
* `setForceEnabled(forceEnabled);`
    * `forceEnabled` (Boolean)
* `setMaximumLocalStorageSize(maximumLocalStorageSize);`
    * `maximumLocalStorageSize` (Integer)
* `setPrintToConsole(printToConsole);` **(iOS only)**
    * `printToConsole` (Boolean)
* `showUserFeedbackViewController(args);` **(iOS only)** _Android alternative: getUserFeedbackActivityIntent(args);_
    * `title`
    * `hint`
    * `subjectHint`
    * `messageHint`
    * `sendButtonText`
    * `cancelButtonText`
    * `feedbackSentCallback` (Function)
    * `styling` (Object)
        * `mainStyling` (Object)
            * `mainBackgroundColor` (String)
            * `secondaryBackgroundColor` (String)
        * `hintStyling` (Object)
            * `hintFont` (String)
            * `hintFontSize` (Integer)
            * `hintFontColor` (String)
        * `subjectStyling` (Object)
            * `subjectFont` (String)
            * `subjectFontSize` (Integer)
            * `subjectFontColor` (String)
            * `subjectPlaceholderFontColor` (String)
        * `messageStyling` (Object)
            * `messageFont` (String)
            * `messageFontSize` (Integer)
            * `messageFontColor` (String)
            * `messagePlaceholderFontColor` (String)
* `t(args);`
    * `tag` (String)
    * `message` (String)
* `w(args);`
    * `tag` (String)
    * `message` (String)

### Properties (read-only)
* `appKey` (String) **(iOS only)**
* `deviceIdentifier` (String)
* `sessionIdentifier` (String)
* `forceEnabled` (Boolean) **(iOS only)**
* `maximumLocalStorageSize` (Integer) **(iOS only)**
* `printToConsole` (Boolean) **(iOS only)**

## Using default feedback screen
### Android
Use following code snippet to create a UserFeedbackActivityIntent, open the activity and fetch the result.

If you want to override the action bar-, screen- or input colors, you need to set the corresponding flag on `true`. 

**You need to define following color resources in the `platform/android/res/values/styles.xml` file.** _Continue reading after the snippet._


```javascript
var intent = Bugfender.getUserFeedbackActivityIntent({
     title: "Title",
     hint: "Hint",
     subjectHint: "Subject",
     messageHint: "Message",
     sendButtonText: "Send",
     customActionBarColors: false,
     customScreenColors: false,
     customInputColors: false
 });

Ti.Android.currentActivity.startActivityForResult(intent, function (e) {
    if (_.isEqual(e.resultCode, Ti.Android.RESULT_OK)) {
        console.log("Feedback sent");
    } else {
        console.log("Feedback cancelled");
    }
});
```

If you've set a custom colors flag to `true`, you need to define a color for *all* the keys. When you don't set *all* the colors, none of the colors will be applied and will result in a `TiRHelper$ResourceNotFoundException`.

For example: if you only want to set the `feedbackAppBarBackgroundColor`, you also need to set the other three properties (`feedbackAppBarTitleColor`, `feedbackAppBarCloseButtonColor` and `feedbackAppBarActionButtonColor`) as well.

### `customActionBarColors`

```xml
<color name="feedbackAppBarBackgroundColor">#2A5246</color>
<color name="feedbackAppBarTitleColor">#FFFFFF</color>
<color name="feedbackAppBarCloseButtonColor">#FFFFFF</color>
<color name="feedbackAppBarActionButtonColor">#FFFFFF</color>
```

### `customScreenColors`

```xml
<color name="feedbackScreenBackgroundColor">#2A5246</color>
<color name="feedbackScreenTextColor">#FFFFFF</color>
```

### `customInputColors`

```xml      
<color name="feedbackInputBackgroundColor">#BFCBC7</color>
<color name="feedbackInputTextColor">#000000</color>
<color name="feedbackInputHintColor">#FFFFFF</color>
```

### iOS

Use following code snippet to open the UserFeedbackViewController:

```javascript
Bugfender.showUserFeedbackViewController({
    title: "Title",
    hint: "Hint",
    subjectHint: "Subject",
    messageHint: "Message",
    sendButtonText: "Send",
    cancelButtonText: "Cancel",
    feedbackSentCallback: function(e) {
        if (e.feedbackSent) {
            console.log("Feedback sent");
        } else {
            console.log("Feedback not sent");
        }
    },
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
```

The `styling` property and it's children properties are optional. If you want to set a `font` or `fontSize`, you always have to define them both.

For example: if you only want to set the `messageFont`, you also need to set `messageFontSize` (and vice versa) as well. Otherwise the property won't be applied.

### Crossplatform sample

Take a look at the [sample](example/example.js) for a crossplatform sample.