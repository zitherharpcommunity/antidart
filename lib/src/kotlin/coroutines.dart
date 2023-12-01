/// Basic primitives for creating and suspending coroutines:
/// [Continuation], [CoroutineContext] interfaces, coroutine creation and suspension top-level functions.
library kotlin.coroutines;

import 'core.dart';

/// Calls the specified function [block] and returns its result.
R run<R>(R Function() block) => block();

R synchronized<R>(Any lock, R Function() block) => block();

Unit when<T>(T value, T Function() func) {}

extension CoroutineUtils on Any {
  /// Calls the specified function [block] with this value as its argument and returns this value.
  T also<T>(Unit Function() block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns this value.
  T apply<T>(T value, T Function() block) => value;

  /// Calls the specified function [block] with this value as its argument and returns its result.
  R let<T, R>(R Function(T) block) => throw UnimplementedError();

  /// Calls the specified function [block] with this value as its receiver and returns its result.
  R run<R>(R Function() block) => block();
}
