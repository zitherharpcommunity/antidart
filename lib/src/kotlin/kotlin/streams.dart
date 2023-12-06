/// Utility functions for working with Java 8 streams.
library kotlin.streams;

extension StreamExension<T> on Stream<T> {
  /// Returns a [List] containing all elements produced by this stream.
  List<T> toList() {
    final List<T> result = <T>[];
    listen(
      (event) => result.add(event),
    );
    return result;
  }
}
