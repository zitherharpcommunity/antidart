// ignore_for_file: camel_case_types

part of kotlin.core;

/// The root of the Kotlin class hierarchy. Every Kotlin class has [Any] as a superclass.
typedef Any = Object;

/// Represents an array (specifically, a Java array when targeting the JVM platform).
///
/// Array instances can be created using the [arrayOf], [arrayOfNulls]
/// and [emptyArray] standard library functions.
///
/// See [Kotlin language documentation](https://kotlinlang.org/docs/basic-types.html#arrays) for more information on arrays.
typedef Array<T> = List<T>;

typedef ArrayList<T> = Array<T>;

/// Represents a value which is either `true` or `false`.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `boolean`.
typedef Boolean = bool;

/// An array of booleans.
///
/// When targeting the JVM, instances of this class are represented as `boolean[]`.
typedef BooleanArray<T> = Array<Boolean>;

/// Represents a 8-bit signed integer.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `byte`.
typedef Byte = int;

/// An array of bytes.
///
/// When targeting the JVM, instances of this class are represented as `byte[]`.
typedef ByteArray<T> = Array<Byte>;

/// Represents a 16-bit Unicode character.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `char`.
typedef Char = String;

/// An array of chars.
///
/// When targeting the JVM, instances of this class are represented as `char[]`.
typedef CharArray<T> = Array<Char>;

/// Represents a double-precision 64-bit IEEE 754 floating point number.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `double`.
typedef Double = double;

/// An array of doubles.
///
/// When targeting the JVM, instances of this class are represented as `double[]`.
typedef DoubleArray<T> = Array<Double>;

/// Represents a single-precision 32-bit IEEE 754 floating point number.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `float`.
typedef Float = double;

/// An array of floats.
///
/// When targeting the JVM, instances of this class are represented as `float[]`.
typedef FloatArray<T> = Array<Float>;

typedef fun = void;

/// Represents a 32-bit signed integer.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `int`.
typedef Int = int;

/// An array of ints.
///
/// When targeting the JVM, instances of this class are represented as `int[]`.
typedef IntArray<T> = Array<Int>;

/// Represents a 64-bit signed integer.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `long`.
typedef Long = int;

/// An array of longs.
///
/// When targeting the JVM, instances of this class are represented as `long[]`.
typedef LongArray<T> = Array<Long>;

/// Nothing has no instances.
///
/// You can use [Nothing] to represent "a value that never exists":
/// for example, if a function has the return type of [Nothing],
/// it means that it never returns (always throws an exception).
typedef Nothing = Never;

/// Superclass for all platform classes representing numeric values.
typedef Number = num;

/// Represents a generic pair of two values.
typedef Pair<A, B> = (A, B);

/// Represents a 16-bit signed integer.
///
/// On the JVM, non-nullable values of this type are represented as values of the primitive type `short`.
typedef Short = int;

/// An array of shorts.
///
/// When targeting the JVM, instances of this class are represented as `short[]`.
typedef ShortArray<T> = Array<Short>;

/// Represents a triad of values.
typedef Triple<A, B, C> = (A, B, C);

typedef UByte = int;

typedef UByteArray = Array<UByte>;

typedef UInt = Int;

typedef ULong = Long;

/// The type with only one value: the [Unit] object.
///
/// This type corresponds to the `void` type in Java.
typedef Unit = void;

typedef UShort = Short;

/// Declares a read-only property or local variable.
typedef val<T> = T;

/// Allows passing a variable number of arguments for a parameter.
typedef vararg<T> = List<T>;

/// Base interface implicitly implemented by all annotation interfaces.
///
/// See [Kotlin language documentation](https://kotlinlang.org/docs/annotations.html) for more information on annotations.
abstract interface class Annotation {}

/// A discriminated union that encapsulates a successful outcome with a value of type [T]
/// or a failure with an arbitrary [Throwable] exception.
final class Result<T> {
  final T value;

  const Result(this.value);

  /// Returns an instance that encapsulates the given [Throwable] as failure.
  @JvmName("failure")
  static Result<Throwable> failure(Throwable exception) => Result(exception);

  /// Returns an instance that encapsulates the given [value] as successful value.
  @JvmName("success")
  static Result<T> success<T>(T value) => Result(value);
}
