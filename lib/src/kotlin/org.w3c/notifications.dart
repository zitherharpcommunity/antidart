// ignore_for_file: non_constant_identifier_names

/// Kotlin JavaScript wrappers for the [Web Notifications API](https://notifications.spec.whatwg.org/).
library org.w3c.notifications;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.w3c.dart';

external GetNotificationOptions getNotificationOptions([
  String? tag = '',
]);

external NotificationAction notificationAction({
  String? action,
  String? title,
  String? icon,
});

external NotificationEventInit notificationEventInit({
  Notification? notification,
  String? action = '',
  Boolean? bubbles = false,
  Boolean? cancelable = false,
  Boolean? composed = false,
});

external NotificationOptions notificationOptions({
  NotificationDirection? dir,
  String? lang = '',
  String? body = '',
  String? tag = '',
  String? image,
  String? icon,
  String? badge,
  String? sound,
  dynamic vibrate,
  Number? timestamp,
  Boolean? renotify = false,
  Boolean? silent = false,
  Boolean? noscreen = false,
  Boolean? requireInteraction = false,
  Boolean? sticky = false,
  Any? data = null,
  Array<NotificationAction>? actions = const [],
});

abstract interface class GetNotificationOptions {
  String? tag;

  String? title;

  external String? icon;
}

abstract interface class Notification extends EventTarget {
  external Array<NotificationAction>? actions;

  external String? badge;

  external String? body;

  external String? sound;

  external Any? data;

  external String? icon;

  external String? image;

  external String? lang;

  external String? tag;

  external Boolean? requireInteraction;

  external NotificationDirection? dir;

  external Boolean? silent;

  external Boolean? renotify;

  external Boolean? noscreen;

  external Boolean? sticky;

  external Number? timestamp;

  external dynamic vibrate;
}

abstract interface class NotificationAction {
  String? action;
}

abstract interface class NotificationDirection {
  external static final NotificationDirection AUTO;

  external static final NotificationDirection LTR;

  external static final NotificationDirection RTL;

  const NotificationDirection();
}

abstract interface class NotificationEventInit {
  external String? action;

  Notification? notification;
}

abstract interface class NotificationOptions {
  external Array<NotificationAction>? actions;

  external String? badge;

  external String? body;

  external String? sound;

  external Any? data;

  external String? icon;

  external String? image;

  external String? lang;

  external String? tag;

  external Boolean? requireInteraction;

  external NotificationDirection? dir;

  external Boolean? silent;

  external Boolean? renotify;

  external Boolean? noscreen;

  external Boolean? sticky;

  external Number? timestamp;

  external dynamic vibrate;
}

abstract interface class NotificationPermission {
  external static final NotificationPermission DEFAULT;

  external static final NotificationPermission DENIED;

  external static final NotificationPermission GRANTED;
}
