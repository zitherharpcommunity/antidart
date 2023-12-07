// ignore_for_file: non_constant_identifier_names

library org.w3c.dom.mediasource;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.w3c.dart';

abstract interface class AppendMode {
  external final AppendMode SEGMENTS;

  external final AppendMode SEQUENCE;
}

abstract interface class EndOfStreamError {
  external final EndOfStreamError DECODE;

  external final EndOfStreamError NETWORK;
}

/// Exposes the JavaScript [MediaSource](https://developer.mozilla.org/en-US/docs/Web/API/MediaSource) to Kotlin.
class MediaSource extends EventTarget implements MediaProvider {
  external final SourceBufferList activeSourceBuffers;

  external Double duration;

  external dynamic Function(Event)? onsourceclose;

  external dynamic Function(Event)? onsourceended;

  external dynamic Function(Event)? onsourceopen;

  external final ReadyState readyState;

  external final SourceBufferList sourceBuffers;

  external SourceBuffer addSourceBuffer(String type);

  external fun clearLiveSeekableRange();

  external fun endOfStream(EndOfStreamError error);

  external fun removeSourceBuffer(SourceBuffer sourceBuffer);

  external fun setLiveSeekableRange(Double start, Double end);

  external static Boolean isTypeSupported(String type);
}

abstract interface class ReadyState {
  external final ReadyState CLOSED;

  external final ReadyState ENDED;

  external final ReadyState OPEN;
}

/// Exposes the JavaScript [SourceBuffer](https://developer.mozilla.org/en-US/docs/Web/API/SourceBuffer) to Kotlin.
class SourceBuffer extends EventTarget {
  external Double appendWindowEnd;

  external Double appendWindowStart;

  external final AudioTrackList audioTracks;

  external final TimeRanges buffered;

  external AppendMode mode;

  external dynamic Function(Event)? onabort;

  external dynamic Function(Event)? onerror;

  external dynamic Function(Event)? onupdateend;

  external dynamic Function(Event)? onupdatestart;

  external Double timestampOffset;

  external final TextTrackList textTracks;

  external final Boolean updating;

  external final VideoTrackList videoTracks;

  external fun abort();

  external fun appendBuffer(dynamic data);

  external fun remove(Double start, Double end);
}

/// Exposes the JavaScript [SourceBufferList](https://developer.mozilla.org/en-US/docs/Web/API/SourceBufferList) to Kotlin.
class SourceBufferList extends EventTarget {
  external final Int length;

  external dynamic Function(Event)? onaddsourcebuffer;

  external dynamic Function(Event)? onremovesourcebuffer;
}

extension MediaSourceSourceBufferListExtension on SourceBufferList {
  external SourceBuffer? operator [](Int index);
}
