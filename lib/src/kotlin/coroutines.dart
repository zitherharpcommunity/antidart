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

/// Base class for [CoroutineContext.Key] associated
/// with polymorphic [CoroutineContext.Element] implementation.
///
/// Polymorphic element implementation implies delegating its [get] and [minusKey]
/// to [getPolymorphicElement] and [minusPolymorphicKey] respectively.
///
/// Polymorphic elements can be extracted from the coroutine context
/// using both element key and its supertype key.
abstract class AbstractCoroutineContextKey<B extends Element, E extends B> {
  /// An instance of base key.
  final KeyCode baseKey;

  /// A function that can safely cast abstract [CoroutineContext.Element]
  /// to the concrete [E] type and return the element
  /// if it is a subtype of [E] or `null` otherwise.
  final E? Function(Element element) safeCast;

  /// Base class for [CoroutineContext.Key] associated
  /// with polymorphic [CoroutineContext.Element] implementation.
  ///
  /// Polymorphic element implementation implies delegating its [get] and [minusKey]
  /// to [getPolymorphicElement] and [minusPolymorphicKey] respectively.
  const AbstractCoroutineContextKey({
    required this.baseKey,
    required this.safeCast,
  });
}

/// Interface representing a continuation after a suspension point that returns a value of type [T].
abstract interface class Continuation<T> {
  /// The context of the coroutine that corresponds to this continuation.
  CoroutineContext get context;

  /// Resumes the execution of the corresponding coroutine passing a successful
  /// or failed result as the return value of the last suspension point.
  fun resumeWith(Result<T> result);
}

/// Marks coroutine context element that intercepts coroutine continuations.
///
/// The coroutines framework uses [ContinuationInterceptor.Key] to retrieve the interceptor
/// and intercepts all coroutine continuations with interceptContinuation invocations.
///
/// [ContinuationInterceptor] behaves like a [polymorphic element],
/// meaning that its implementation delegates [get] and [minusKey]
/// to [getPolymorphicElement] and [minusPolymorphicKey] respectively.
///
/// [ContinuationInterceptor] subtypes can be extracted from the coroutine context
/// using either [ContinuationInterceptor.Key] or subtype key
/// if it extends [AbstractCoroutineContextKey].
abstract interface class ContinuationInterceptor implements Element {
  const ContinuationInterceptor();

  /// Returns the element with the given [key] from this context or `null`.
  E? get<E extends Element>(KeyCode key);

  /// Returns continuation that wraps the original [continuation],
  /// thus intercepting all resumptions.
  ///
  /// This function is invoked by coroutines framework
  /// when needed and the resulting continuations are cached internally
  /// per each instance of the original [continuation].
  ///
  /// This function may simply return original [continuation]
  /// if it does not want to intercept this particular continuation.
  ///
  /// When the original continuation completes, coroutine framework
  /// invokes [releaseInterceptedContinuation] with the resulting continuation
  /// if it was intercepted, that is if [interceptContinuation] had previously
  /// returned a different continuation instance.
  Continuation<T> interceptContinuation<T>(Continuation<T> continuation);

  /// Returns a context containing elements from this context,
  /// but without an element with the specified [key].
  CoroutineContext minusKey(KeyCode key);

  /// Invoked for the continuation instance returned by [interceptContinuation]
  /// when the original continuation completes and will not be used anymore.
  ///
  /// This function is invoked only if [interceptContinuation] had returned
  /// a different continuation instance from the one it was invoked with.
  ///
  /// Default implementation does nothing.
  fun releaseInterceptedContinuation<T>(Continuation<T> continuation);
}

/// Persistent context for the coroutine.
///
/// It is an indexed set of [Element] instances.
///
/// An indexed set is a mix between a set and a map.
///
/// Every element in this set has a unique [Key].
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

extension ContinuationExtension<T> on Continuation<T> {
  /// Resumes the execution of the corresponding coroutine
  /// passing [value] as the return value of the last suspension point.
  fun resume(T value) => Result.success(value);

  /// Resumes the execution of the corresponding coroutine
  /// so that the [exception] is re-thrown right after the last suspension point.
  fun resumeWithException(Throwable exception) => Result.failure(exception);
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

extension ElementExtension on Element {
  /// Returns the current element if it is associated with the given [key]
  /// in a polymorphic manner or null otherwise.
  ///
  /// This method returns non-null value if either [Element.key] is equal to the given key
  /// or if the key is associated with [Element.key] via [AbstractCoroutineContextKey].
  ///
  /// See [AbstractCoroutineContextKey] for the example of usage.
  @experimentalStdlibApi
  external E? getPolymorphicElement<E extends Element>(KeyCode key);

  /// Returns the current element if it is associated with the given [key]
  /// in a polymorphic manner or null otherwise.
  ///
  /// This method returns non-null value if either [Element.key] is equal to the given key
  /// or if the key is associated with [Element.key] via [AbstractCoroutineContextKey].
  ///
  /// See [AbstractCoroutineContextKey] for the example of usage.
  @experimentalStdlibApi
  external CoroutineContext minusPolymorphicKey(KeyCode key);
}
