// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.clipboard;

import '/src/kotlin/kotlin.dart';
import '../../org.w3c.dart';

external ClipboardEventInit clipboardEventInit({
  DataTransfer? clipboardData,
  Boolean? bubbles = false,
  Boolean? cancelable = false,
  Boolean? composed = false,
});

external ClipboardPermissionDescriptor clipboardPermissionDescriptor({
  Boolean? allowWithoutGesture = false,
});

/// Exposes the JavaScript [Clipboard](https://developer.mozilla.org/en-US/docs/Web/API/Clipboard) to Kotlin
class Clipboard extends EventTarget {
  const Clipboard();

  external Promise<DataTransfer> read();

  external Promise<String> readText();

  external Promise<Unit> write(DataTransfer data);

  external Promise<Unit> writeText(String data);
}

class ClipboardEvent extends Event {
  external static Short get AT_TARGET;

  external static Short get BUBBLING_PHASE;

  external static Short get CAPTURING_PHASE;

  external static Short get NONE;

  final ClipboardEventInit? eventInitDict;

  const ClipboardEvent({
    required super.type,
    this.eventInitDict,
  });

  external DataTransfer? get clipboardData;
}

abstract interface class ClipboardEventInit extends EventInit {
  external DataTransfer? clipboardData;
}

abstract interface class ClipboardPermissionDescriptor {
  external Boolean? allowWithoutGesture;
}

abstract interface class EventInit {
  Boolean? bubbles;

  Boolean? cancelable;

  Boolean? composed;
}
