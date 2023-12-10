// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.encryptedmedia;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.khronos.dart';
import '/src/kotlin/org.w3c.dart';

external MediaEncryptedEventInit mediaEncryptedEventInit({
  String? initDataType = '',
  ArrayBuffer? initData,
  Boolean? bubbles = false,
  Boolean? cancelable = false,
  Boolean? composed = false,
});

external MediaKeyMessageEventInit mediaKeyMessageEventInit({
  MediaKeyMessageType? messageType,
  ArrayBuffer? message,
  Boolean? bubbles = false,
  Boolean? cancelable = false,
  Boolean? composed = false,
});

external MediaKeySystemConfiguration mediaKeySystemConfiguration({
  String? label = '',
  Array<String>? initDataTypes = const [],
  Array<MediaKeySystemMediaCapability>? audioCapabilities = const [],
  Array<MediaKeySystemMediaCapability>? videoCapabilities = const [],
  MediaKeysRequirement? distinctiveIdentifier,
  MediaKeysRequirement? persistentState,
  Array<String>? sessionTypes,
});

external MediaKeySystemMediaCapability mediaKeySystemMediaCapability({
  String? contentType = '',
  String? robustness = '',
});

class MediaEncryptedEvent extends Event {
  final MediaEncryptedEventInit eventInitDict;

  const MediaEncryptedEvent({
    required super.type,
    required this.eventInitDict,
  });

  ArrayBuffer? get initData => eventInitDict.initData;

  String? get initDataType => eventInitDict.initDataType;
}

abstract class MediaEncryptedEventInit extends EventInit {
  ArrayBuffer? initData;

  String? initDataType;
}

/// Exposes the JavaScript [MediaKeyMessageEvent](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeyMessageEvent) to Kotlin.
class MediaKeyMessageEvent extends Event {
  final MediaKeyMessageEventInit eventInitDict;

  const MediaKeyMessageEvent({
    required super.type,
    required this.eventInitDict,
  });

  ArrayBuffer? get message => eventInitDict.message;

  MediaKeyMessageType? get messageType => eventInitDict.messageType;
}

abstract class MediaKeyMessageEventInit extends EventInit {
  ArrayBuffer? message;

  MediaKeyMessageType? messageType;
}

abstract class MediaKeyMessageType {
  external MediaKeyMessageType get INDIVIDUALIZATION_REQUEST;

  external MediaKeyMessageType get LICENSE_RELEASE;

  external MediaKeyMessageType get LICENSE_RENEWAL;

  external MediaKeyMessageType get LICENSE_REQUEST;
}

/// Exposes the JavaScript [MediaKeys](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeys) to Kotlin.
abstract class MediaKeys {
  const MediaKeys();

  MediaKeySession createSession(MediaKeySessionType sessionType);

  Promise<Boolean> setServerCertificate(dynamic serverCertificate);
}

/// Exposes the JavaScript [MediaKeySession](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeySession) to Kotlin.
abstract class MediaKeySession extends EventTarget {
  external final Promise<Unit> closed;

  external final Double expiration;

  external final MediaKeyStatusMap keyStatuses;

  external dynamic Function(Event)? onkeystatuseschange;

  external dynamic Function(MessageEvent)? onmessage;

  external final String sessionId;

  MediaKeySession();

  Promise<Unit> close();

  Promise<Unit> generateRequest({
    required String initDataType,
    required dynamic initData,
  });

  Promise<Boolean> load(String sessionId);

  Promise<Unit> remove();

  Promise<Unit> update(dynamic response);
}

abstract class MediaKeySessionType {
  external final MediaKeySessionType PERSISTENT_LICENSE;

  external final MediaKeySessionType TEMPORARY;
}

abstract class MediaKeysRequirement {
  external final MediaKeysRequirement NOT_ALLOWED;

  external final MediaKeysRequirement OPTIONAL;

  external final MediaKeysRequirement REQUIRED;

  const MediaKeysRequirement();
}

abstract class MediaKeyStatus {
  external final MediaKeyStatus EXPIRED;

  external final MediaKeyStatus INTERNAL_ERROR;

  external final MediaKeyStatus OUTPUT_DOWNSCALED;

  external final MediaKeyStatus OUTPUT_RESTRICTED;

  external final MediaKeyStatus RELEASED;

  external final MediaKeyStatus STATUS_PENDING;

  external final MediaKeyStatus USABLE;
}

/// Exposes the JavaScript [MediaKeyStatusMap](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeyStatusMap) to Kotlin.
abstract class MediaKeyStatusMap {
  const MediaKeyStatusMap();

  external Int get size;

  Any? get(dynamic keyId);

  Boolean has(dynamic keyId);
}

/// Exposes the JavaScript [MediaKeySystemAccess](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeySystemAccess) to Kotlin.
abstract class MediaKeySystemAccess {
  external final String keySystem;

  const MediaKeySystemAccess();

  external Promise<MediaKeys> createMediaKeys();

  external MediaKeySystemConfiguration getConfiguration();
}

/// Exposes the JavaScript [MediaKeySystemConfiguration](https://developer.mozilla.org/en-US/docs/Web/API/MediaKeySystemAccess/getConfiguration) to Kotlin.
abstract class MediaKeySystemConfiguration {
  external Array<MediaKeySystemMediaCapability>? audioCapabilities;

  external MediaKeysRequirement? distinctiveIdentifier;

  external Array<String>? initDataTypes;

  external String? label;

  external MediaKeysRequirement? persistentState;

  external Array<String>? sessionTypes;

  external Array<MediaKeySystemMediaCapability>? videoCapabilities;
}

abstract class MediaKeySystemMediaCapability {
  external String? contentType;

  external String? robustness;
}
