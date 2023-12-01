/// System-related utility functions.
library kotlin.system;

import 'dart:io';

import 'package:antidart/src/kotlin.dart';

/// Terminates the currently running process.
Nothing exitProcess({required Int status}) => exit(status);

@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')

/// Gets current system time in microseconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
Long getTimeMicros() => DateTime.timestamp().microsecondsSinceEpoch;

@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')

/// Gets current system time in milliseconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
Long getTimeMillis() => DateTime.timestamp().millisecondsSinceEpoch;

@Deprecated('Use measureTime() or TimeSource.Monotonic.markNow() instead.')

/// Gets current system time in seconds since certain moment in the past,
/// only delta between two subsequent calls makes sense.
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
