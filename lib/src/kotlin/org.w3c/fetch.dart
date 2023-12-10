// ignore_for_file: non_constant_identifier_names

/// Kotlin JavaScript wrappers for the [W3C fetch API](https://fetch.spec.whatwg.org).
library org.w3c.fetch;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.khronos.dart';
import '/src/kotlin/org.w3c.dart';

external RequestInit requestInit({
  String? method,
  dynamic headers,
  dynamic body,
  String? referrer,
  dynamic referrerPolicy,
  RequestMode? mode,
  RequestCredentials? credentials,
  RequestCache? cache,
  RequestRedirect? redirect,
  String? integrity,
  Boolean? keepalive,
  Any? window,
});

external ResponseInit responseInit({
  Short? status = 200,
  String? statusText = 'OK',
  dynamic headers,
});

/// Exposes the JavaScript [Body](https://developer.mozilla.org/en-US/docs/Web/API/Body) to Kotlin.
abstract class Body {
  abstract final Boolean bodyUsed;

  external Promise<ArrayBuffer> arrayBuffer();

  external Promise<Blob> blob();

  external Promise<FormData> formData();

  external Promise<Any?> json();

  external Promise<String> text();
}

/// Exposes the JavaScript [Headers](https://developer.mozilla.org/en-US/docs/Web/API/Headers) to Kotlin.
class Headers {
  final dynamic init;

  const Headers(this.init);

  external fun append(String name, String value);

  external fun delete(String name);

  external String? get(String name);

  external Boolean has(String name);

  external fun set(String name, String value);
}

class Request extends Body {
  external final Headers headers;

  external final RequestCache cache;

  external final RequestCredentials credentials;

  external final RequestDestination destination;

  external final RequestMode mode;

  external final RequestRedirect redirect;

  external final String referrer;

  external final dynamic referrerPolicy;

  external final RequestType type;

  external final String url;

  external final String integrity;

  external final Boolean keepalive;

  external final String method;

  @override
  external Boolean get bodyUsed;

  external Request clone();
}

abstract class RequestCache {
  external final RequestCache DEFAULT;

  external final RequestCache FORCE_CACHE;

  external final RequestCache NO_CACHE;

  external final RequestCache NO_STORE;

  external final RequestCache RELOAD;

  external final RequestCache ONLY_IF_CACHED;
}

abstract class RequestCredentials {
  external final RequestCredentials INCLUDE;

  external final RequestCredentials OMIT;

  external final RequestCredentials SAME_ORIGIN;
}

abstract class RequestDestination {
  external final RequestDestination DOCUMENT;

  external final RequestDestination EMBED;

  external final RequestDestination EMPTY;

  external final RequestDestination FONT;

  external final RequestDestination IMAGE;

  external final RequestDestination MANIFEST;

  external final RequestDestination MEDIA;

  external final RequestDestination OBJECT;

  external final RequestDestination REPORT;

  external final RequestDestination SCRIPT;

  external final RequestDestination SERVICEWORKER;

  external final RequestDestination SHAREDWORKER;

  external final RequestDestination STYLE;

  external final RequestDestination WORKER;

  external final RequestDestination XSLT;
}

abstract class RequestInit {
  external dynamic body;

  external RequestCache? cache;

  external RequestCredentials? credentials;

  external dynamic headers;

  external String? integrity;

  external Boolean? keepalive;

  external String? method;

  external RequestMode? mode;

  external RequestRedirect? redirect;

  external String? referrer;

  external dynamic referrerPolicy;

  external Any? window;
}

abstract class RequestMode {
  external final RequestMode CORS;

  external final RequestMode NAVIGATE;

  external final RequestMode NO_CORS;

  external final RequestMode SAME_ORIGIN;
}

abstract class RequestRedirect {
  external final RequestRedirect ERROR;

  external final RequestRedirect FOLLOW;

  external final RequestRedirect MANUAL;
}

abstract class RequestType {
  external final RequestType AUDIO;

  external final RequestType EMPTY;

  external final RequestType FONT;

  external final RequestType IMAGE;

  external final RequestType STYLE;

  external final RequestType SCRIPT;

  external final RequestType TRACK;

  external final RequestType VIDEO;
}

abstract class ResponseInit {
  dynamic headers;

  Short? status;

  String? statusText;
}

abstract class ResponseType {
  external final ResponseType BASIC;

  external final ResponseType CORS;

  external final ResponseType DEFAULT;

  external final ResponseType ERROR;

  external final ResponseType OPAQUE;

  external final ResponseType OPAQUEREDIRECT;
}
