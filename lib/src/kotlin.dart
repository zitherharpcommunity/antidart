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
/// See examples at [here](https://github.com/kotlin/antidart/tree/master/examples).
library kotlin;

import '/src/kotlin/core.dart';

export 'kotlin/annotation.dart';
export 'kotlin/collections.dart';
export 'kotlin/companion.dart';
export 'kotlin/comparisons.dart';
export 'kotlin/core.dart';
export 'kotlin/coroutines.dart';
export 'kotlin/io.dart';
export 'kotlin/math.dart';
export 'kotlin/random.dart';
export 'kotlin/reflect.dart';
export 'kotlin/system.dart';
export 'kotlin/text.dart';
export 'kotlin/time.dart';

List<T> listOf<T>(List<T> list) => list;

/// Returns an array containing the specified elements.
Array<T> arrayOf<T>(Array<T> array) => array;

/// Returns an array of objects of the given type with the given size, initialized with null values.
Array<Unit> arrayOfNulls(Int length) => Array.filled(length, null);
Array<T> emptyArray<T>() => Array<T>.empty();
ArrayList<T> arrayListOf<T>(ArrayList<T> list) => list;
BooleanArray booleanArrayOf(BooleanArray array) => array;
ByteArray byteArrayOf(ByteArray array) => array;
CharArray charArrayOf(CharArray array) => array;
DoubleArray doubleArrayOf(DoubleArray array) => array;
IntArray intArrayOf(IntArray array) => array;
FloatArray floatArrayOf(FloatArray array) => array;
LongArray longArrayOf(LongArray array) => array;
ShortArray shortArrayOf(ShortArray array) => array;
T enumValueOf<T extends Enum>(String name) => enumValueOf(name);
Map<K, V> mapOf<K, V>(Map<K, V> map) => map;
Nothing error(Any message) => throw Exception();

/// Executes the given function [action] specified number of [times].
Unit repeat({required Int times, required Unit Function(Int) action}) {
  for (var i = 0; i < times; i++) {
    action(i);
  }
}

/// Throws an [IllegalArgumentException] if the [value] is false.
Unit require({required Boolean value, Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is null. Otherwise returns the not null value.
T requireNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

/// Throws an IllegalStateException with the result of calling lazyMessage if the value is false.
Unit check(Boolean value, {Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is null. Otherwise returns the not null value.
T checkNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

// ignore: non_constant_identifier_names
Unit TODO([String? reason]) {
  throw UnimplementedError(reason);
}
