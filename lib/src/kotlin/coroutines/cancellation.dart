library kotlin.coroutines.cancellation;

import '/kotlin.dart';

/// Thrown by cancellable suspending functions
/// if the coroutine is cancelled while it is suspended.
///
/// It indicates _normal_ cancellation of a coroutine.
final class CancellationException extends IllegalStateException {}

/// Creates an instance of [CancellationException] with the given [message] and [cause].
CancellationException cancellationException() => CancellationException();