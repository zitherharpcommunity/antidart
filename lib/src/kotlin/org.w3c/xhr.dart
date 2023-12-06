library org.w3c.xhr;

import '/src/kotlin/org.w3c.dart';

/// Exposes the JavaScript [ProgressEvent](https://developer.mozilla.org/en-US/docs/Web/API/ProgressEvent) to Kotlin
class ProgressEvent extends Event {
  ProgressEvent({required super.type});
}
