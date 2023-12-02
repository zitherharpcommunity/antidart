/// Basic primitives for creating and suspending coroutines:
/// [Continuation], [CoroutineContext] interfaces,
/// coroutine creation and suspension top-level functions.
library kotlin.coroutines;

import 'dart:html';

import '/src/kotlin.dart';

/// Classes and interfaces marked with this annotation are restricted
/// when used as receivers for extension `suspend` functions.
///
/// These `suspend` extensions can only invoke other member
/// or extension `suspend` functions on this particular receiver
/// and are restricted from calling arbitrary suspension functions.
const RestrictsSuspension = _RestrictsSuspension();

/// Calls the specified function [block] and returns its result.
R run<R>(R Function() block) => block();

/// Executes the given function [block] while holding the monitor of the given object [lock].
R synchronized<R>(Any lock, R Function() block) => block();

Unit when<T>(T Function(T) block) {}

/// Base class for [CoroutineContext.element] implementations.
abstract class AbstractCoroutineContextElement implements Element {
  /// A key of this coroutine context element.
  final KeyCode key;

  const AbstractCoroutineContextElement({required this.key});
}

/// Persistent context for the coroutine.
///
/// It is an indexed set of [Element] instances.
///
/// An indexed set is a mix between a set and a map.
///
/// Every element in this set has a unique Key.
abstract interface class CoroutineContext<E> {
  /// An element of the [CoroutineContext].
  ///
  /// An element of the coroutine context is a singleton context by itself.
  CoroutineContext get element;

  /// Key for the elements of [CoroutineContext].
  ///
  /// [E] is a type of element with this key.
  KeyCode get key;
}

/// Classes and interfaces marked with this annotation are restricted
/// when used as receivers for extension `suspend` functions.
///
/// These `suspend` extensions can only invoke other member
/// or extension `suspend` functions on this particular receiver
/// and are restricted from calling arbitrary suspension functions.
@Target([
  AnnotationTarget.ANNOTATION_CLASS,
])
final class _RestrictsSuspension {
  const _RestrictsSuspension();
}

extension CoroutineUtils on Any {
  /// Calls the specified function [block] with this value as its argument and returns this value.
  T also<T>(Unit Function() block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns this value.
  T apply<T>(T Function(T) block) => block(this as T);

  /// Calls the specified function [block] with this value as its argument and returns its result.
  R let<T, R>(R Function(T) block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns its result.
  R run<R>(R Function() block) => block();

  /// Executes the given [block] function on this resource
  /// and then closes it down correctly whether an exception is thrown or not.
  R use<R>(R Function(Any) block) => block(this);
}
