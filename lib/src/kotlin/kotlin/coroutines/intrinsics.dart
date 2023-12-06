// ignore_for_file: non_constant_identifier_names

/// Low-level building blocks for libraries that provide coroutine-based APIs.
library kotlin.coroutines.intrinsics;

import '/src/kotlin/kotlin.dart';
import '../../kotlinx.dart';

/// This value is used as a return value of
/// [suspendCoroutineUninterceptedOrReturn] `block` argument to state
/// that the execution was suspended and will not return any result immediately.
///
/// **Note: this value should not be used in general code.**
///
/// Using it outside of the context of [suspendCoroutineUninterceptedOrReturn] function
/// return value (including, but not limited to, storing this value in other properties,
/// returning it from other functions, etc) can lead to unspecified behavior of the code.
external Any get COROUTINE_SUSPENDED;

/// Creates unintercepted coroutine with receiver type [R] and result type [T].
///
/// This function creates a new,
/// fresh instance of suspendable computation every time it is invoked.
///
/// To start executing the created coroutine,
/// invoke `resume(Unit)` on the returned [Continuation] instance.
///
/// The completion continuation is invoked
/// when coroutine completes with result or exception.
///
/// This function returns unintercepted continuation.
///
/// Invocation of `resume(Unit)` starts coroutine immediately
/// in the invoker's call stack without going through the [ContinuationInterceptor]
/// that might be present in the completion's [CoroutineContext].
///
/// It is the invoker's responsibility to ensure
/// that a proper invocation context is established.
///
/// Note that completion of this function may get invoked in an arbitrary context.
///
/// [Continuation.intercepted] can be used to acquire the intercepted continuation.
///
/// Invocation of `resume(Unit)` on intercepted continuation guarantees
/// that execution of both the coroutine and completion happens
/// in the invocation context established by [ContinuationInterceptor].
///
/// Repeated invocation of any resume function on the resulting continuation
/// corrupts the state machine of the coroutine and may result in arbitrary behaviour or exception.
external Continuation<Unit> createCoroutineUnintercepted<R, T>({
  R? receiver,
  required Continuation<T> completion,
});

/// Starts an unintercepted coroutine with receiver type [R]
/// and result type [T] and executes it until its first suspension.
///
/// Returns the result of the coroutine or throws its exception
/// if it does not suspend or [COROUTINE_SUSPENDED] if it suspends.
///
/// In the latter case, the completion continuation is invoked
/// when the coroutine completes with a result or an exception.
///
/// The coroutine is started directly in the invoker's thread
/// without going through the [ContinuationInterceptor]
/// that might be present in the completion's [CoroutineContext].
///
/// It is the invoker's responsibility to ensure
/// that a proper invocation context is established.
///
/// This function is designed to be used
/// from inside of [suspendCoroutineUninterceptedOrReturn]
/// to resume the execution of the suspended coroutine
/// using a reference to the suspending function.
external Any? startCoroutineUninterceptedOrReturn<R, T>({
  R? receiver,
  required Continuation<T> completion,
});

/// Obtains the current continuation instance inside suspend functions
/// and either suspends currently running coroutine
/// or returns result immediately without suspension.
///
/// If the [block] returns the special [COROUTINE_SUSPENDED] value,
/// it means that suspend function did suspend the execution
/// and will not return any result immediately.
///
/// In this case, the [Continuation] provided to the block
/// shall be resumed by invoking [Continuation.resumeWith] at some moment in the future
/// when the result becomes available to resume the computation.
///
/// Otherwise, the return value of the block must have a type assignable to [T]
/// and represents the result of this suspend function.
///
/// It means that the execution was not suspended
/// and the [Continuation] provided to the block shall not be invoked.
/// As the result type of the block is declared as `Any?`
/// and cannot be correctly type-checked,
/// its proper return type remains on the conscience of the suspend function's author.
///
/// Invocation of [Continuation.resumeWith] resumes coroutine directly
/// in the invoker's thread without going through the [ContinuationInterceptor]
/// that might be present in the coroutine's [CoroutineContext].
///
/// It is the invoker's responsibility to ensure
/// that a proper invocation context is established.
/// [Continuation.intercepted]can be used to acquire the intercepted continuation.
///
/// Note that it is not recommended to call either [Continuation.resume]
/// nor [Continuation.resumeWithException] functions synchronously
/// in the same stackframe where suspension function is run.
///
/// Use [suspendCoroutine] as a safer way to obtain current continuation instance.
external T suspendCoroutineUninterceptedOrReturn<T>({
  Any? Function(Continuation<T>) block,
});

extension ContinuationExtension<T> on Continuation<T> {
  /// Intercepts this continuation with [ContinuationInterceptor].
  ///
  /// This function shall be used on the immediate result of
  /// [createCoroutineUnintercepted] or [suspendCoroutineUninterceptedOrReturn],
  /// in which case it checks for [ContinuationInterceptor] in the continuation's context,
  /// invokes [ContinuationInterceptor.interceptContinuation], caches and returns the result.
  ///
  /// If this function is invoked on other [Continuation] instances
  /// it returns this continuation unchanged.
  external Continuation<T> intercepted();
}
