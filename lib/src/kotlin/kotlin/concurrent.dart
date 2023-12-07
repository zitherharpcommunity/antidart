/// Utility functions for concurrent programming.
library kotlin.concurrent;

import '/src/kotlin/kotlin.dart';

/// Marks the backing field of the annotated `var` property as `volatile`,
/// meaning that reads and writes to this field are atomic
/// and writes are always made visible to other threads.
///
/// If another thread reads the value of this field (e.g. through its accessor),
/// it sees not only that value, but all side effects that led to writing that value.
///
/// Note that only _backing field_ operations are atomic
/// when the field is annotated with [Volatile].
///
/// For example, if the property getter or setter make several operations
/// with the backing field, a _property_ operation,
/// i.e. reading or setting it through these accessors, is not guaranteed to be atomic.
@Target([
  AnnotationTarget.FIELD,
])
final class Volatile {
  const Volatile();
}

/// Marks the backing field of the annotated `var` property as `volatile`,
/// meaning that reads and writes to this field are atomic
/// and writes are always made visible to other threads.
const volatile = Volatile();

/// An [Array] in which elements are always updated atomically.
///
/// For additional details about atomicity guarantees for reads and writes see [Volatile].
@experimentalStdlibApi
class AtomicArray<T> {
  /// Returns the number of elements in the array.
  external Int get length;

  /// Atomically gets the value of the element at the given [index].
  external operator [](Int index);

  /// Atomically sets the value of the element at the given [index] to the [newValue].
  external operator []=(Int index, T newValue);

  /// Atomically sets the value of the element at the given [index]
  /// to the [newValue] and returns the old value of the element.
  external T getAndSet(Int index, T newValue);

  /// Returns the string representation of the underlying [IntArray].
  external String toString();

  /// Atomically sets the value of the element at the given [index]
  /// to the [newValue] if the current value equals the [expectedValue].
  ///
  /// Returns `true` if the operation was successful and false only
  /// if the current value of the element was not equal to the expected value.
  external Boolean compareAndSet(Int index, T expectedValue, T newValue);

  /// Atomically sets the value of the element at the given [index] to the [newValue]
  /// if the current value equals the [expectedValue] and returns the old value of the element in any case.
  external T compareAndExchange(Int index, T expectedValue, T newValue);
}

/// Creates a new [AtomicArray] of the given [size],
/// where each element is initialized by calling the given [init] function.
external AtomicArray<T> atomicArray<T>(Int size, T Function(Int) init);

/// An object reference that is always updated atomically.
@experimentalStdlibApi
class AtomicReference<T> {
  T value;

  /// An object reference that is always updated atomically.
  AtomicReference(this.value);

  /// Atomically sets the value to the given [newValue] and returns the old value.
  external T getAndSet(T newValue);

  /// Returns the string representation of the current [value].
  external String toString();

  /// Atomically sets the [value] to the given [newValue]
  /// if the current [value] equals the [expectedValue],
  /// returns `true` if the operation was successful and `false` only
  /// if the current [value] was not equal to the [expectedValue].
  external Boolean compareAndSet(T expectedValue, T newValue);

  /// Atomically sets the [value] to the given [newValue]
  /// if the current [value] equals the [expectedValue] and returns the old [value] in any case.
  external T compareAndExchange(T expectedValue, T newValue);
}
