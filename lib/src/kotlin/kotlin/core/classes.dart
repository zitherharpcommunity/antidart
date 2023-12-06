part of kotlin.core;

/// Represents a version of the Kotlin standard library.
///
/// [major], [minor] and [patch] are integer components of a version,
/// they must be non-negative and not greater than 255 [MAX_COMPONENT_VALUE].
final class KotlinVersion {
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

class RuntimeException implements Exception {
  final String? message;

  final Throwable? cause;

  const RuntimeException({
    this.message,
    this.cause,
  });
}
