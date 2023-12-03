/// Extensions for [Kotlin reflection](https://kotlinlang.org/docs/reflection.html) provided by `kotlin-reflect` library.
library kotlin.reflect.full;

/// An exception that is thrown when `call` is invoked on a callable
/// or `get` or `set` is invoked on a property
/// and that callable is not accessible (in JVM terms) from the calling method.
final class IllegalCallableAccessException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  const IllegalCallableAccessException({this.cause});
}

/// An exception that is thrown when `getDelegate` is invoked on a [KProperty] object
/// that was not made accessible with [isAccessible].
final class IllegalPropertyDelegateAccessException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  const IllegalPropertyDelegateAccessException({this.cause});
}

/// An exception that is thrown when the code tries to introspect a property of a class
/// or a package and that class or the package no longer has that property.
final class NoSuchPropertyException implements Exception {
  /// The original exception thrown by the JVM.
  final Exception? cause;

  const NoSuchPropertyException({this.cause});
}
