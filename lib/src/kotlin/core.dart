/// Core functions and types, available on all supported platforms.
library kotlin.core;

import '/src/kotlin.dart';

/// The root of the Kotlin class hierarchy. Every Kotlin class has [Any] as a superclass.
typedef Any = Object?;

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

typedef UInt = Int;

typedef ULong = Long;

/// The type with only one value: the [Unit] object.
///
/// This type corresponds to the `void` type in Java.
typedef Unit = void;

/// Possible levels of a deprecation.
///
/// The level specifies how the deprecated element usages are reported in code.
enum DeprecationLevel {
  /// Usage of the deprecated element will be reported as a warning.
  WARNING,

  /// Usage of the deprecated element will be reported as an error.
  ERROR,

  /// Deprecated element will not be accessible from code.
  HIDDEN,
}

/// Represents a version of the Kotlin standard library.
///
/// [major], [minor] and [patch] are integer components of a version,
/// they must be non-negative and not greater than 255 [MAX_COMPONENT_VALUE].
class KotlinVersion {
  /// Returns the current version of the Kotlin standard library.
  static const KotlinVersion CURRENT = KotlinVersion(
    major: 1,
    minor: 9,
  );
  /// Maximum value a version component can have, a constant value 255.
  static const Int MAX_COMPONENT_VALUE = 255;
  final Int major;

  final Int minor;

  final Int patch;

  /// Creates a version from major and minor components, leaving patch component zero.
  const KotlinVersion({
    required this.major,
    required this.minor,
    this.patch = 0,
  })  : assert(major >= 0),
        assert(minor >= 0),
        assert(patch >= 0),
        assert(major <= MAX_COMPONENT_VALUE),
        assert(minor <= MAX_COMPONENT_VALUE),
        assert(patch <= MAX_COMPONENT_VALUE);
}

/// Represents a value with lazy initialization.
///
/// To create an instance of [Lazy] use the lazy function.
abstract interface class Lazy<T> {
  /// Gets the lazily initialized value of the current Lazy instance.
  ///
  /// Once the value was initialized it must not change
  /// during the rest of lifetime of this Lazy instance.
  T get value;

  /// Returns `true` if a value for this [Lazy] instance has been already initialized, and `false` otherwise.
  ///
  /// Once this function has returned `true` it stays true for the rest of lifetime of this [Lazy] instance.
  Boolean isInitialized();
}

/// Specifies how a [Lazy] instance synchronizes initialization among multiple threads.
enum LazyThreadSafetyMode {
  /// Locks are used to ensure that only a single thread can initialize the [Lazy] instance.
  SYNCHRONIZED,

  /// Initializer function can be called several times on concurrent
  /// access to uninitialized [Lazy] instance value,
  /// but only the first returned value will be used as the value of [Lazy] instance.
  PUBLICATION,

  /// No locks are used to synchronize an access to the [Lazy] instance value;
  /// if the instance is accessed from multiple threads, its behavior is undefined.
  NONE,
}
