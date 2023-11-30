extension MultiIterableExtension<T> on Iterable<Iterable<T>> {
  String contentDeepToString() => join(', ');

  Iterable<T> flatten() => expand((element) => element);
}

extension NumberExtension on Iterable<double> {
  double sum() => reduce((value, element) => value + element);
}

extension ComparableExtension<T extends Comparable<T>> on Comparable<T> {
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
