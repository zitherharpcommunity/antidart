/// Collection types, such as [Iterable], [Collection], [List], [Set], [Map]
/// and related top-level and extension functions.
library kotlin.collections;

import 'dart:math';

import 'core.dart';

/// Data class representing a value from a collection or sequence,
/// along with its index in that collection or sequence.
typedef IndexedValue<T> = (Int, T);

/// A generic collection of elements.
///
/// Methods in this interface support only read-only access to the collection.
///
/// Read/write access is supported through the [MutableCollection] interface.
///
/// - [E] - the type of elements contained in the collection.
/// The collection is covariant in its element type.
abstract interface class Collection<E> extends Iterable<E> {}

extension ArrayCompanion<T> on Array<T> {
  Iterable<int> get indices => indexed.map((e) => e.$1);

  int get lastIndex => size - 1;

  int get size => length;

  operator [](int index) => get(index);

  operator []=(int index, T value) => set(index, value);

  /// Returns `true` if all elements match the given [predicate].
  bool all(bool Function(T) predicate) => every(predicate);

  /// Returns a string representation of the contents of the specified array as if it is [List].
  @Deprecated('')
  String contentToString() => join(', ');

  /// Returns the number of elements matching the given [predicate].
  int count(bool Function(T)? predicate) =>
      predicate == null ? size : where(predicate).length;

  /// Returns a list containing only distinct elements from the given array.
  Iterable<T> distinct() => toSet();

  /// Returns a list containing all elements except first [n] elements.
  Iterable<T> drop(int n) => skip(n);

  /// Returns a list containing all elements except last [n] elements.
  Iterable<T> dropLast(int n) => take(length - n);

  /// Returns a list containing only elements matching the given predicate.
  Iterable<T> filter(bool Function(T) predicate) => where(predicate);

  /// Returns a list containing only elements matching the given predicate.
  Iterable<T> filterIndexed(bool Function(int, T) predicate) =>
      where(predicate as bool Function(T));

  /// Returns a list containing only elements matching the given predicate.
  Iterable<T> filterNot(bool Function(T it) predicate) => where(predicate);

  /// Returns the first element matching the given predicate, or null if no such element was found.
  T? find(bool Function(T? it) predicate) =>
      cast<T?>().firstWhere(predicate, orElse: () => null);

  /// Returns the last element matching the given predicate, or null if no such element was found.
  T? findLast(bool Function(T? it) predicate) =>
      cast<T?>().lastWhere(predicate, orElse: () => null);
  T get(int index) => elementAt(index);

  /// Returns an element at the given index or the result of calling the defaultValue function if the index is out of bounds of this array.
  T getOrElse(int index, T Function(int) defaultValue) =>
      size < length - 1 ? get(index) : defaultValue(index);

  /// Returns an element at the given index or the result of calling the defaultValue function if the index is out of bounds of this array.
  T? getOrNull(int index, T Function(int) defaultValue) =>
      size < length - 1 ? get(index) : null;

  /// Returns single element, or `null` if the array is empty or has more than one element.
  T? singleOrNull(Boolean Function(T? it) test) {
    return cast<T?>().singleWhere(test, orElse: () => null);
  }

  String joinToString({
    String separator = ', ',
    String prefix = '',
    String postfix = '',
    Int limit = -1,
    String truncated = '...',
    String Function(T)? transform,
  }) {
    return join(separator);
  }

  void set(int index, T value) => this[index] = value;

  List<T> minus(Iterable<T> elements) {
    return this..removeRange(0, 0);
  }

  List<T> minusElement(T element) {
    return this..remove(element);
  }

  /// Returns `true` if no elements match the given [predicate].
  bool none({bool Function(T)? predicate}) =>
      predicate == null ? isEmpty : !any(predicate);

  List<T> plus(Iterable<T> elements) {
    return this..addAll(elements);
  }

  List<T> plusElement(T element) {
    return this..add(element);
  }

  /// Performs the given action on each element and returns the collection itself afterwards.
  Iterable<T> onEach(Unit Function(T) action) {
    forEach(action);
    return this;
  }

  (List<T>, List<T>) partition(bool Function(T) predicate) {
    return partition(predicate);
  }

  List<T> shuffled(Random random) {
    return toList()..shuffle(random);
  }

  Iterable<T?> requireNoNulls() {
    final elements = whereType<T>();
    if (elements.length == length) return elements;
    throw ArgumentError();
  }

  Set<T> union(Iterable<T> others) {
    return toSet();
  }

  Array<T> toTypedArray() => Array<T>.from(this);

  Iterable<int> withIndex() => indices;

  Map<K, V> groupBy<K, V>(
      K Function(Any?) keySelector, V Function(Any?)? valueTransform) {
    return Map<K, V>.fromIterable(this,
        key: keySelector, value: valueTransform);
  }

  List<List<T>> chunked(int size) {
    final result = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      result.add(
        sublist(i, min(i + size, length)),
      );
    }
    return result;
  }

  Boolean containsAll(Iterable<T> elements) {
    return elements.every((element) => contains(element));
  }

  /// Returns index of the first element matching the given predicate, or -1 if the array does not contain such element.
  Int indexOfFirst(bool Function(T?) predicate) {
    final value = find(predicate);
    if (value == null) return -1;
    return indexOf(value);
  }

  /// Returns a set containing all elements that are contained by both this array and the specified collection.
  Set<T> intersect(Iterable<T> other) => Set.from(this)..addAll(other);
}
