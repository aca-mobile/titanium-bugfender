/**
 * This file was auto-generated by the Titanium Module SDK helper for Android
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2010 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 *
 */
package be.aca.mobile.bugfender;

import android.content.Intent;
import android.util.Log;

import com.bugfender.sdk.Bugfender;
import com.bugfender.sdk.LogLevel;
import com.bugfender.sdk.ui.FeedbackStyle;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.titanium.TiApplication;
import org.appcelerator.titanium.proxy.IntentProxy;
import org.appcelerator.titanium.util.TiRHelper;

import java.net.URL; 
import java.util.UUID;

@Kroll.module(name="Bugfender", id="be.aca.mobile.bugfender")
public class BugfenderModule extends KrollModule {
	public BugfenderModule() {
		super();
	}

	@Kroll.method
	public void d(KrollDict props) {
		Bugfender.d(props.getString("tag"), props.getString("message"));
	}

	@Kroll.method
	public void disableReflection(boolean disable) {
		Bugfender.disableReflection(disable);
	}

	@Kroll.method
	public void e(KrollDict props) {
		Bugfender.e(props.getString("tag"), props.getString("message"));
	}

	@Kroll.method
	public void enableCrashReporting() {
		Bugfender.enableCrashReporting();
	}

	@Kroll.method
	public void enableLogcatLogging() {
		Bugfender.enableLogcatLogging();
	}

	@Kroll.method
	public void enableUIEventLogging() {
		Bugfender.enableUIEventLogging(TiApplication.getInstance());
	}

	@Kroll.method
	public void f(KrollDict props) {
		Bugfender.f(props.getString("tag"), props.getString("message"));
	}

	@Kroll.method
	public void forceSendOnce() {
		Bugfender.forceSendOnce();
	}

	@Kroll.getProperty
	@Kroll.method
	public String getDeviceUrl() {
		URL deviceUrl = Bugfender.getDeviceUrl();
		return deviceUrl == null ? null : deviceUrl.toString();
	}

	@Kroll.getProperty
	@Kroll.method
	public String getSessionUrl() {
		URL sessionUrl = Bugfender.getSessionUrl();
		return sessionUrl == null ? null : sessionUrl.toString();
	}

	@Kroll.method
	public IntentProxy getUserFeedbackActivityIntent(KrollDict props) {
		String title = props.getString("title");
		String hint = props.getString("hint");
		String subjectHint = props.getString("subjectHint");
		String messageHint = props.getString("messageHint");
		String sendButtonText = props.getString("sendButtonText");

		boolean customActionBarColors = props.optBoolean("customActionBarColors", false);
		boolean customScreenColors = props.optBoolean("customScreenColors" ,false);
		boolean customInputColors = props.optBoolean("customInputColors", false);

		FeedbackStyle feedbackStyle = new FeedbackStyle();

		if (customActionBarColors) {
			setCustomActionBarColors(feedbackStyle);
		}

		if (customScreenColors) {
			setCustomScreenColors(feedbackStyle);
		}

		if (customInputColors) {
			setCustomInputColors(feedbackStyle);
		}

		Intent feedbackIntent = Bugfender.getUserFeedbackActivityIntent(TiApplication.getAppRootOrCurrentActivity(), title, hint, subjectHint, messageHint, sendButtonText, feedbackStyle);
		return new IntentProxy(feedbackIntent);
	}

	private void setCustomActionBarColors(FeedbackStyle feedbackStyle) {
		try {
			int appBarBackgroundColor = TiRHelper.getResource("color.feedbackAppBarBackgroundColor");
			int appBarTitleColor = TiRHelper.getResource("color.feedbackAppBarTitleColor");
			int appBarCloseButtonColor = TiRHelper.getResource("color.feedbackAppBarCloseButtonColor");
			int appBarActionButtonColor = TiRHelper.getResource("color.feedbackAppBarActionButtonColor");

			feedbackStyle.setAppBarColors(appBarBackgroundColor, appBarTitleColor, appBarCloseButtonColor, appBarActionButtonColor);
		} catch (TiRHelper.ResourceNotFoundException e) {
			Log.e("BugfenderModule", e.toString());
		}
	}

	private void setCustomScreenColors(FeedbackStyle feedbackStyle) {
		try {
			int screenBackgroundColor = TiRHelper.getResource("color.feedbackScreenBackgroundColor");
			int screenTextColor = TiRHelper.getResource("color.feedbackScreenTextColor");


			feedbackStyle.setScreenColors(screenBackgroundColor, screenTextColor);
		} catch (TiRHelper.ResourceNotFoundException e) {
			Log.e("BugfenderModule", e.toString());
		}
	}

	private void setCustomInputColors(FeedbackStyle feedbackStyle) {
		try {
			int inputBackgroundColor = TiRHelper.getResource("color.feedbackInputBackgroundColor");
			int inputTextColor = TiRHelper.getResource("color.feedbackInputTextColor");
			int inputHintColor = TiRHelper.getResource("color.feedbackInputHintColor");

			feedbackStyle.setInputColors(inputBackgroundColor, inputTextColor, inputHintColor);
		} catch (TiRHelper.ResourceNotFoundException e) {
			Log.e("BugfenderModule", e.toString());
		}
	}

	@Kroll.method
	public void i(KrollDict props) {
		Bugfender.i(props.getString("tag"), props.getString("message"));
	}

	@Kroll.method
	public void init(KrollDict props) {
		Bugfender.init(getActivity(), props.getString("applicationToken"), props.optBoolean("debug", false));
	}

	@Kroll.method
	public void logDefault(KrollDict props) {
		log(LogLevel.Debug, props);
	}

	@Kroll.method
	public void logWarning(KrollDict props) {
		log(LogLevel.Warning, props);
	}

	@Kroll.method
	public void logError(KrollDict props) {
		log(LogLevel.Error, props);
	}

	private void log(LogLevel logLevel, KrollDict props) {
		int lineNumber = props.getInt("lineNumber");
		String method = props.getString("method");
		String file = props.getString("file");
		String tag = props.getString("tag");
		String message = props.getString("message");

		Bugfender.log(lineNumber, method, file, logLevel, tag, message);
	}

	@Kroll.method
	public void removeDeviceKey(String deviceKey) {
		Bugfender.removeDeviceKey(deviceKey);
	}

	@Kroll.method
	public String sendIssue(KrollDict props) {
		URL url = Bugfender.sendIssue(props.getString("title"), props.getString("text"));
		return url == null ? null : url.toString();
	}

	@Kroll.method
	public String sendUserFeedback(KrollDict props) {
		URL url = Bugfender.sendUserFeedback(props.getString("title"), props.getString("message"));
		return url == null ? null : url.toString();
	}

	@Kroll.method
	public String sendCrash(KrollDict props) {
		URL url = Bugfender.sendCrash(props.getString("title"), props.getString("text"));
		return url == null ? null : url.toString();
	}

	@Kroll.method
	public void setApiUrl(String url) {
		Bugfender.setApiUrl(url);
	}

	@Kroll.method
	public void setBaseUrl(String url) {
		Bugfender.setBaseUrl(url);
	}

	@Kroll.method
	public void setDeviceBoolean(KrollDict props) {
		Bugfender.setDeviceBoolean(props.getString("key"), props.getBoolean("value"));
	}

	@Kroll.method
	public void setDeviceDouble(KrollDict props) {
		double d = props.getDouble("value");
		Bugfender.setDeviceFloat(props.getString("key"), (float) d);
	}

	@Kroll.method
	public void setDeviceInteger(KrollDict props) {
		Bugfender.setDeviceInteger(props.getString("key"), props.getInt("value"));
	}

	@Kroll.method
	public void setDeviceString(KrollDict props) {
		Bugfender.setDeviceString(props.getString("key"), props.getString("value"));
	}

	@Kroll.method
	public void setForceEnabled(boolean forceEnabled) {
		Bugfender.setForceEnabled(forceEnabled);
	}

	@Kroll.method
	public void setMaximumLocalStorageSize(long maximumLocalStorageSize) {
		Bugfender.setMaximumLocalStorageSize(maximumLocalStorageSize);
	}

	@Kroll.method
	public void t(KrollDict props) {
		Bugfender.t(props.getString("tag"), props.getString("message"));
	}

	@Kroll.method
	public void w(KrollDict props) {
		Bugfender.w(props.getString("tag"), props.getString("message"));
	}
}

