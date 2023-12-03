// ignore_for_file: non_constant_identifier_names

/// [**Kotlin Standard Library**](https://kotlinlang.org/api/latest/jvm/stdlib/#kotlin-standard-library)
///
/// The **Kotlin Standard Library** provides living essentials for everyday work with Kotlin.
/// These include:
///
/// * Higher-order functions implementing idiomatic patterns
/// ([let](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/let.html),
/// [apply](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/apply.html),
/// [use](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/use.html),
/// [synchronized](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin/apply.html), etc).
/// * Extension functions providing querying operations for collections (eager) and sequences (lazy).
/// * Various utilities for working with strings and char sequences.
/// * Extensions for JDK classes making it convenient to work with files, IO, and threading.
///
/// See examples at [here](https://play.kotlinlang.org/byExample/overview).
library kotlin;

import '/kotlin.dart';

export 'src/kotlin/annotation.dart';
export 'src/kotlin/browser.dart';
export 'src/kotlin/collections.dart';
export 'src/kotlin/concurrent.dart';
export 'src/kotlin/comparisons.dart';
export 'src/kotlin/core.dart';
export 'src/kotlin/coroutines.dart';
export 'src/kotlin/dom.dart';
export 'src/kotlin/experimental.dart';
export 'src/kotlin/io.dart';
export 'src/kotlin/jvm.dart';
export 'src/kotlin/math.dart';
export 'src/kotlin/native.dart';
export 'src/kotlin/random.dart';
export 'src/kotlin/ranges.dart';
export 'src/kotlin/reflect.dart';
export 'src/kotlin/streams.dart';
export 'src/kotlin/system.dart';
export 'src/kotlin/test.dart';
export 'src/kotlin/text.dart';
export 'src/kotlin/time.dart';

List<T> listOf<T>(List<T> list) => list;

/// Returns an array containing the specified elements.
Array<T> arrayOf<T>(Array<T> array) => array;

/// Returns an array of objects of the given type with the given [size], initialized with `null` values.
Array<Unit> arrayOfNulls(Int size) => Array.filled(size, null);

/// Returns an empty array of the specified type [T].
Array<T> emptyArray<T>() => Array<T>.empty();

/// Returns an array containing enum [T] entries.
Array<T> enumValues<T extends Enum>() => <T>[];

ArrayList<T> arrayListOf<T>(ArrayList<T> list) => list;

/// Returns an array containing the specified [Boolean] values.
BooleanArray booleanArrayOf(BooleanArray array) => array;

/// Returns an array containing the specified [Byte] numbers.
ByteArray byteArrayOf(ByteArray array) => array;

/// Returns an array containing the specified characters.
CharArray charArrayOf(CharArray array) => array;

/// Returns an array containing the specified [Double] numbers.
DoubleArray doubleArrayOf(DoubleArray array) => array;

/// Returns an array containing the specified [Int] numbers.
IntArray intArrayOf(IntArray array) => array;

/// Returns an array containing the specified [Float] numbers.
FloatArray floatArrayOf(FloatArray array) => array;

/// Returns an array containing the specified [Long] numbers.
LongArray longArrayOf(LongArray array) => array;

/// Returns an array containing the specified Short numbers.
ShortArray shortArrayOf(ShortArray array) => array;

/// Returns an enum entry with specified [name].
T enumValueOf<T extends Enum>(String name) => enumValueOf(name);

Map<K, V> mapOf<K, V>(Map<K, V> map) => map;

/// Throws an [IllegalStateException] with the given [message].
Nothing error(Any message) => throw Exception();

/// Creates a new instance of the [Lazy]
/// that uses the specified initialization function [initializer]
/// and the default thread-safety mode [LazyThreadSafetyMode.SYNCHRONIZED].
Lazy<T> lazy<T>({
  required LazyThreadSafetyMode mode,
  required T Function() initializer,
}) {
  throw Exception();
}

/// Creates a new instance of the [Lazy] that is already initialized with the specified [value].
Lazy<T> lazyOf<T>(T value) => throw UnimplementedError();

/// Executes the given function [action] specified number of [times].
Unit repeat(Int times, Unit Function(Int) action) {
  for (var i = 0; i < times; i++) {
    action(i);
  }
}

/// Throws an [IllegalArgumentException] if the [value] is false.
Unit require({required Boolean value, Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is `null`.
///
/// Otherwise returns the not null value.
T requireNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

/// Throws an [IllegalStateException] with the result of calling lazyMessage if the value is `false`.
Unit check(Boolean value, {Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is `null`.
///
/// Otherwise returns the not null value.
T checkNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

/// Always throws [NotImplementedError] stating that operation is not implemented.
Unit TODO([String? reason]) => throw NotImplementedError(reason);

typedef NotImplementedError = UnimplementedError;

/// The base class for all errors and exceptions.
///
/// Only instances of this class can be thrown or caught.
base class Throwable {
  /// The detail message string.
  final String? message;

  ///  The cause of this throwable.
  final Throwable? cause;

  /// The base class for all errors and exceptions.
  ///
  /// Only instances of this class can be thrown or caught.
  const Throwable({this.message, this.cause});

  /// Returns an array of stack trace strings representing the stack trace pertaining to this throwable.
  @experimentalNativeApi
  Array<String> getStackTrace() => throw UnimplementedError();

  /// Prints the detailed description of this throwable to the standard error output.
  ///
  /// Note that the format of the output is not stable and may change in the future.
  Unit printStackTrace() => throw UnimplementedError();

  /// Returns the short description of this throwable consisting
  /// of the exception class name (fully qualified if possible)
  /// followed by the exception message if it is not null.
  external String toString();
}
