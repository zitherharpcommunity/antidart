/// System-related utility functions.
library kotlin.system;

import 'dart:io';

import 'package:antidart/kotlin.dart';

/// Terminates the currently running process.
Nothing exitProcess({required Int status}) => exit(status);

/// Gets current system time in microseconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')
Long getTimeMicros() => DateTime.timestamp().microsecondsSinceEpoch;

/// Gets current system time in milliseconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')
Long getTimeMillis() => DateTime.timestamp().millisecondsSinceEpoch;

/// Gets current system time in seconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')
Long getTimeNanos() => DateTime.timestamp().microsecondsSinceEpoch ~/ 1000;

/// Executes the given [block] and returns elapsed time in milliseconds.
Long measureNanoTime(Unit Function() block) {
  final start = DateTime.now();
  block();
  return DateTime.now().difference(start).inMicroseconds ~/ 1000;
}

/// Executes the given [block] and returns elapsed time in microseconds.
Long measureTimeMicros(Unit Function() block) {
  final start = DateTime.now();
  block();
  return DateTime.now().difference(start).inMicroseconds;
}

/// Executes the given [block] and returns elapsed time in milliseconds.
Long measureTimeMillis(Unit Function() block) {
  final start = DateTime.now();
  block();
  return DateTime.now().difference(start).inMilliseconds;
}
