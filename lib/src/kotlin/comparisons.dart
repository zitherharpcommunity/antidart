/// Helper functions for creating [Comparator] instances.
library kotlin.comparisons;

import '/src/kotlin.dart';

extension MultiIterableExtension<T> on Iterable<Iterable<T>> {
  String contentDeepToString() => join(', ');

  Iterable<T> flatten() => expand((element) => element);
}

extension NumberExtension on Iterable<double> {
  double sum() => reduce((value, element) => value + element);
}

extension ComparisonUtils<T extends Comparable<T>> on Comparable<T> {
  bool operator <(T other) => compareTo(other) < 0;
  bool operator >(T other) => compareTo(other) > 0;
  bool operator <=(T other) => compareTo(other) <= 0;
  bool operator >=(T other) => compareTo(other) >= 0;

  /// Ensures that this value is not less than the specified [minimumValue].
  Comparable<T> coerceAtLeast(T minimumValue) {
    return this >= minimumValue ? this : minimumValue;
  }

  /// Ensures that this value is not greater than the specified [maximumValue].
  Comparable<T> coerceAtMost(T maximumValue) {
    return this > maximumValue ? maximumValue : this;
  }

  /// Ensures that this value lies between the [minimumValue] and [maximumValue].
  Comparable<T> coerceIn(T minimumValue, T maximumValue) {
    return coerceAtLeast(minimumValue).coerceAtMost(maximumValue);
  }
}

/// Compares two nullable [Comparable] values. [Null] is considered less than any value.
Int compareValues<T extends Comparable<T>>(T? a, T? b) {
  if (a == b) return 0;
  if (a == null) return -1;
  if (b == null) return 1;
  return a.compareTo(b);
}

/// Returns the greater of the given values according to the order specified by the given comparator.
T maxOf<T extends Comparable<T>>(
  T a, {
  required Array<T> others,
  Comparator<T>? comparator,
}) {
  if (others.isEmpty) return a;
  var max = a;
  for (final other in others) {
    if (comparator == null) {
      if (max > other) {
        max = other;
      }
    } else {
      if (comparator(max, other) < 0) {
        max = other;
      }
    }
  }
  return max;
}

/// Returns the smaller of the given values according to the order specified by the given [comparator].
T minOf<T extends Comparable<T>>(
  T a, {
  required Array<T> others,
  Comparator<T>? comparator,
}) {
  if (others.isEmpty) return a;
  var min = a;
  for (final other in others) {
    if (comparator == null) {
      if (min < other) {
        min = other;
      }
    } else {
      if (comparator(min, other) > 0) {
        min = other;
      }
    }
  }
  return min;
}
