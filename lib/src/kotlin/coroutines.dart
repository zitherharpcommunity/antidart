/// Basic primitives for creating and suspending coroutines:
/// [Continuation], [CoroutineContext] interfaces,
/// coroutine creation and suspension top-level functions.
library kotlin.coroutines;

import 'dart:html';

import '/kotlin.dart';

export 'coroutines/cancellation.dart';
export 'coroutines/intrinsics.dart';

/// Classes and interfaces marked with this annotation are restricted
/// when used as receivers for extension `suspend` functions.
///
/// These `suspend` extensions can only invoke other member
/// or extension `suspend` functions on this particular receiver
/// and are restricted from calling arbitrary suspension functions.
const restrictsSuspension = RestrictsSuspension();

/// Calls the specified function [block] and returns its result.
R run<R>(R Function() block) => block();

/// Executes the given function [block] while holding the monitor of the given object [lock].
R synchronized<R>(Any lock, R Function() block) => block();

Unit when<T>(T Function(T it) block) {}

/// Base class for [CoroutineContext.element] implementations.
abstract class AbstractCoroutineContextElement implements Element {
  /// A key of this coroutine context element.
  final KeyCode key;

  const AbstractCoroutineContextElement({required this.key});
}

/// Interface representing a continuation after a suspension point that returns a value of type [T].
abstract interface class Continuation<T> {
  /// The context of the coroutine that corresponds to this continuation.
  CoroutineContext get context;

  /// Resumes the execution of the corresponding coroutine passing a successful
  /// or failed result as the return value of the last suspension point.
  fun resumeWith(Result<T> result);
}

extension ContinuationExtension<T> on Continuation<T> {
  /// Resumes the execution of the corresponding coroutine
  /// passing [value] as the return value of the last suspension point.
  fun resume(T value) => Result.success(value);

  /// Resumes the execution of the corresponding coroutine
  /// so that the [exception] is re-thrown right after the last suspension point.
  fun resumeWithException(Throwable exception) => Result.failure(exception);
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
final class RestrictsSuspension {
  const RestrictsSuspension();
}

extension CoroutineExtension on Any {
  /// Calls the specified function [block] with this value as its argument and returns this value.
  T also<T>(Unit Function() block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns this value.
  T apply<T>(T Function(T it) block) => block(this as T);

  /// Calls the specified function [block] with this value as its argument and returns its result.
  R let<T, R>(R Function(T it) block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns its result.
  R run<R>(R Function() block) => block();

  /// Executes the given [block] function on this resource
  /// and then closes it down correctly whether an exception is thrown or not.
  R use<R>(R Function(Any it) block) => block(this);
}
