library org.w3c.dom;

import '/src/kotlin/kotlin.dart';
import '/src/kotlin/org.w3c.dart';

export 'dom/clipboard.dart';
export 'dom/events.dart';
export 'dom/mediasource.dart';
export 'dom/parsing.dart';
export 'dom/pointerevents.dart';
export 'dom/svg.dart';
export 'dom/url.dart';

abstract class DataTransfer {}

abstract interface class MediaProvider {}

abstract class TimeRanges {
  external Int get length;

  Double start(Int index);

  Double end(Int index);
}

abstract class AudioTrackList extends EventTarget {}

abstract class TextTrackList extends EventTarget {}

abstract class VideoTrackList extends EventTarget {}

abstract interface class ItemArrayLike<T> {
  external T? item(Int index);
}

extension DomItemArrayLikeExtension<T> on ItemArrayLike<T> {
  /// Returns the view of this `ItemArrayLike<T>` collection as `List<T>`.
  List<T> asList() => [];
}
