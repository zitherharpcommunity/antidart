import 'types.dart';

extension AnyCompanion on Any {
  dynamic asDynamic() => this;

  T unsafeCast<T>() => this as T;

  (Any, Any) to(Any that) => (this, that);

  /// Returns this value if it satisfies the given [predicate] or null, if it doesn't.
  Any takeIf<T>(bool Function(Any) predicate) => predicate(this) ? this : null;

  /// Returns this value if it does not satisfies the given [predicate] or null, if it doesn't.
  Any takeUnless<T>(bool Function(Any) predicate) =>
      predicate(this) ? null : this;
}
