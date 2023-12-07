// ignore_for_file: non_constant_identifier_names

library org.w3c.xhr;

import 'dart:html';

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.w3c.dart';

/// Exposes the JavaScript [FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData) to Kotlin
class FormData {
  final HTMLFormElement form;

  const FormData(this.form);

  external fun append(String name, String value);

  external fun appendFile(
    String name,
    Blob value,
    String fileName,
  );

  external fun delete(String name);

  external dynamic get(String name);

  external Array<dynamic> getAll(String name);

  external Boolean has(String name);

  external fun set(String name, String value);

  external fun setFile(
    String name,
    Blob value,
    String fileName,
  );
}

/// Exposes the JavaScript [ProgressEvent](https://developer.mozilla.org/en-US/docs/Web/API/ProgressEvent) to Kotlin
class ProgressEvent extends Event {
  external static Short get AT_TARGET;

  external static Short get BUBBLING_PHASE;

  external static Short get CAPTURING_PHASE;

  external static Short get NONE;

  final ProgressEventInit eventInitDict;

  external final Number loaded;

  external final Number total;

  external final Boolean lengthComputable;

  const ProgressEvent({
    required super.type,
    required this.eventInitDict,
  });
}

abstract class ProgressEventInit extends EventInit {
  external final Number? loaded;

  external final Number? total;

  external final Boolean? lengthComputable;
}

abstract class XMLHttpRequest extends XMLHttpRequestEventTarget {
  external static Short get DONE;

  external static Short get HEADERS_RECEIVED;

  external static Short get LOADING;

  external static Short get OPENED;

  external static Short get UNSENT;

  external dynamic Function(Event)? onreadystatechange;

  external final Short readyState;

  external final Any? response;

  external final String responseText;

  external final Document? responseXML;

  external final Short status;

  external final String statusText;

  external XMLHttpRequestResponseType responseType;

  external final String responseURL;

  external Int timeout;

  external Boolean withCredentials;

  external final XMLHttpRequestUpload upload;

  external fun abort();

  external String getAllResponseHeaders();

  external String? getResponseHeader();

  external fun open(
    String method,
    String url, {
    Boolean? async,
    String? username,
    String? password,
  });

  external fun overrideMimeType(String mime);

  external fun send(dynamic data);

  external fun setRequestHeader(String name, String value);
}

/// Exposes the JavaScript [XMLHttpRequestEventTarget](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequestEventTarget) to Kotlin
abstract class XMLHttpRequestEventTarget extends EventTarget {
  external dynamic Function(Event)? onabort;

  external dynamic Function(Event)? onerror;

  external dynamic Function(Event)? onload;

  external dynamic Function(Event)? onloadend;

  external dynamic Function(ProgressEvent)? onloadstart;

  external dynamic Function(ProgressEvent)? onprogress;

  external dynamic Function(Event)? ontimeout;
}

abstract class XMLHttpRequestResponseType {
  external static XMLHttpRequestResponseType ARRAYBUFFER;

  external static XMLHttpRequestResponseType BLOB;

  external static XMLHttpRequestResponseType DOCUMENT;

  external static XMLHttpRequestResponseType JSON;

  external static XMLHttpRequestResponseType TEXT;

  external static XMLHttpRequestResponseType EMPTY;
}

abstract class XMLHttpRequestUpload extends XMLHttpRequestEventTarget {}
