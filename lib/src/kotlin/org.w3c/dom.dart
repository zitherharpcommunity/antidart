library org.w3c.dom;

import '/src/kotlin/kotlin.dart';

export 'dom/clipboard.dart';
export 'dom/events.dart';
export 'dom/mediasource.dart';
export 'dom/pointerevents.dart';
export 'dom/url.dart';

abstract class DataTransfer {}

abstract interface class ItemArrayLike<T> {
  external T? item(Int index);
}

extension DomItemArrayLikeExtension<T> on ItemArrayLike<T> {
  /// Returns the view of this `ItemArrayLike<T>` collection as `List<T>`.
  List<T> asList() => [];
}
