/// Core functions and types, available on all supported platforms.
library kotlin.core;

import '/src/kotlin.dart';

part 'core/annotations.dart';
part 'core/classes.dart';
part 'core/enums.dart';
part 'core/types.dart';

extension CompanionObject on Any {
  dynamic asDynamic() => this;

  /// Casts the given value to the class represented by this [T] object.
  ///
  /// Returns `null` if the value is `null` or if it is not an instance of this class.
  T? safeCast<T>() => this as T?;

  /// Casts the given value to the class represented by this [T] object.
  ///
  /// Throws an exception if the value is `null` or if it is not an instance of this class.
  T unsafeCast<T>() => this as T;

  (Any, Any) to(Any that) => (this, that);

  /// Returns this value if it satisfies the given [predicate] or null, if it doesn't.
  Any? takeIf<T>(bool Function(Any) predicate) => predicate(this) ? this : null;

  /// Returns this value if it does not satisfies the given [predicate] or null, if it doesn't.
  Any? takeUnless<T>(bool Function(Any) predicate) =>
      predicate(this) ? null : this;
}

class IllegalStateException implements Exception {}