// ignore_for_file: non_constant_identifier_names

/// Low-level building blocks for libraries that provide coroutine-based APIs.
library kotlin.coroutines.intrinsics;

import '/kotlin.dart';

// TODO: createCoroutineUnintercepted, startCoroutineUninterceptedOrReturn

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
