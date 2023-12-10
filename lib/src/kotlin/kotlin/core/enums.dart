part of '/src/kotlin/kotlin/core.dart';

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
