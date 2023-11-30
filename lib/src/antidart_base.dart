import 'package:antidart/src/kotlin/primitive.dart';

/// Prints a string representation of the object to the console.
Unit println(Object? object) => print(object);

List listOf(List list) => list;

/// Returns an array containing the specified elements.
Array arrayOf(Array array) => array;

/// Returns an array of objects of the given type with the given size, initialized with null values.
Array<Unit> arrayOfNulls(Int length) => Array.filled(length, null);
Array<T> emptyArray<T>() => Array<T>.empty();
ArrayList arrayListOf(ArrayList list) => list;
BooleanArray booleanArrayOf(BooleanArray array) => array;
ByteArray byteArrayOf(ByteArray array) => array;
CharArray charArrayOf(CharArray array) => array;
DoubleArray doubleArrayOf(DoubleArray array) => array;
IntArray intArrayOf(IntArray array) => array;
FloatArray floatArrayOf(FloatArray array) => array;
LongArray longArrayOf(LongArray array) => array;
ShortArray shortArrayOf(ShortArray array) => array;
T enumValueOf<T extends Enum>(String name) => enumValueOf(name);
Map mapOf(Map map) => map;
Nothing error(Any message) => throw Exception();

/// Executes the given function [action] specified number of [times].
Unit repeat({required Int times, required Unit Function(Int) action}) {
  for (var i = 0; i < times; i++) {
    action(i);
  }
}

/// Throws an [IllegalArgumentException] if the [value] is false.
void require({required Boolean value, Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is null. Otherwise returns the not null value.
T requireNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

/// Throws an IllegalStateException with the result of calling lazyMessage if the value is false.
void check(Boolean value, {Any Function()? lazyMessage}) {
  if (!value) throw Exception('IllegalStateException');
}

/// Throws an [IllegalStateException] with the result of calling [lazyMessage] if the value is null. Otherwise returns the not null value.
T checkNotNull<T>(T? value, {Any Function()? lazyMessage}) {
  if (value == null) throw Exception('IllegalStateException');
  return value;
}

// ignore: non_constant_identifier_names
void TODO([String? reason]) {
  throw UnimplementedError(reason);
}

void when<T>(T value, T Function() func) {}

extension CoroutineCompanion on Object {
  T? let<T>(T Function() f) => f();

  T also<T>(T Function() f) => f();

  T run<T>(T Function() f) => f();

  T apply<T>(T value, T Function() func) => value;
}

void test() {
  int? a = null;
  a?.let(() => null);
}
